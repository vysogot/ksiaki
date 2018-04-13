<?php

function exception_handler($exception) {

  ob_get_clean();

  $code = $exception->getCode();
  if ($code != 404) {
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
