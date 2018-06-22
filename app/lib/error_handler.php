<?php

use \Rollbar\Rollbar;
use \Rollbar\Payload\Level;

include 'logger.php';

if ($env == 'development' || $env == 'staging') {
    log_access('REQUEST: ' . $_SERVER['REQUEST_URI'] . ' SCRIPT: ' . $_SERVER['PHP_SELF'], array_merge($_GET, $_POST));
}

if ($env == 'production' || $env == 'staging') {

    Rollbar::init(
        array(
            'access_token' => $GLOBALS['config']['rollbar_key'],
            'environment' => $env
        )
    );

}

function exception_handler($exception) {

    ob_get_clean();

    $code = $exception->getCode();

    if ($code != 404) {

        log_error($exception->getFile() . ":" . $exception->getLine() . " " . $exception->getMessage(), array_merge($_GET, $_POST));
        $code = 500;

    }

    http_response_code($code);

    if ($env == 'production' || $env == 'staging') {
        Rollbar::log(Level::ERROR, $exception);
        redirect('/404.php');
    } else {
        include realpath(__DIR__ . "/../500.php");
    }

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
