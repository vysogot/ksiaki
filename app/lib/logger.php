<?php

function logger($log_type, $message, $context = []) {

  $log_file = $GLOBALS['config']['logs_dir'] . $log_type . '.log';

  $fp = fopen($log_file, 'a') or exit("Can't open $log_file!");
  $time = date('[Y-m-d H:i:s]');
  $json = json_encode($context);

  fwrite($fp, "$time $log_type $message $json" . PHP_EOL);
  fclose($fp);

  return true;

}
