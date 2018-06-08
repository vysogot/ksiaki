<?php

use \Monolog\Logger;
use \Monolog\Formatter\LineFormatter;
use \Monolog\Handler\StreamHandler;

// access log
if ($env == 'development') {
    $log = new Logger('info');
    $formatter = new LineFormatter(null, null, false, true);

    $infoHandler = new StreamHandler('../log/info.log', Logger::DEBUG);
    $infoHandler->setFormatter($formatter);

    $log->pushHandler($infoHandler);
    $log->info('REQUEST: ' . $_SERVER['REQUEST_URI'] . ' SCRIPT: ' . $_SERVER['PHP_SELF'], array_merge($_GET, $_POST));
}

function exception_handler($exception) {

    ob_get_clean();

    $formatter = new LineFormatter(null, null, false, true);

    $code = $exception->getCode();

    if ($code != 404) {

        $log = new Logger('error');

        // Error level handler
        $errorHandler = new StreamHandler('../log/error.log', Logger::ERROR);
        $errorHandler->setFormatter($formatter);

        // This will have only ERROR messages
        $log->pushHandler($errorHandler);
        $log->error($exception->getFile() . ":" . $exception->getLine() . " " . $exception->getMessage(), array_merge($_GET, $_POST));

        $code = 500;

    }

    http_response_code($code);

    include realpath(__DIR__ . "/../$code.php");
    exit();
}

function error_handler($level, $message, $file, $line)
{
    if (error_reporting() !== 0) {
        throw new \ErrorException($message, 0, $level, $file, $line);
    }
}

error_reporting(E_ALL);
set_error_handler('error_handler');
set_exception_handler('exception_handler');

if ($env == 'production') {

    Raven_Autoloader::register();

    $client = new Raven_Client($GLOBALS['config']['sentry_key']);
    $client->install();

}
