<?php

function log_access($message, $context = []) {
  log_write('access', $message, $context);
}

function log_error($message, $context = []) {
  log_write('error', $message, $context);
}


function log_write($log_type, $message, $context = []) {

  switch ($log_type) {

    case 'error':
      $log_file = $GLOBALS['config']['logs_dir'] . 'error.log';
    break;

    case 'access':
      $log_file = $GLOBALS['config']['logs_dir'] . 'access.log';
    break;

  }

  $fp = fopen($log_file, 'a') or exit("Can't open $log_file!");
  $time = date('[Y-m-d H:i:s]');
  $json = json_encode($context);

  fwrite($fp, "$time $log_type $message $json" . PHP_EOL);
  fclose($fp);

  return true;

}
