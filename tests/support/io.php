<?php

const FAILED_OUTPUT_DIR_PATH = 'tests/output/';
const TMP_OUTPUT_FILE_PATH = 'tests/output/tmp.html';
const COOKIE_FILE_PATH = 'tests/output/cookie.txt';

function basic_curl_handle($path) {
  $curl_handle = curl_init($GLOBALS['config']['TESTING_BASE_URL'] . $path);

  curl_setopt($curl_handle, CURLOPT_REFERER, $GLOBALS['config']['TESTING_BASE_URL']);
  curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($curl_handle, CURLOPT_FRESH_CONNECT, true);
  curl_setopt($curl_handle, CURLOPT_HEADER, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYPEER, 0);
  curl_setopt($curl_handle, CURLOPT_COOKIEJAR, COOKIE_FILE_PATH);
  curl_setopt($curl_handle, CURLOPT_COOKIEFILE, COOKIE_FILE_PATH);
  curl_setopt($curl_handle, CURLOPT_HTTPHEADER, ['Accept-Language: pl']);
  curl_setopt($curl_handle, CURLOPT_FOLLOWLOCATION, true);

  return $curl_handle;
}

function execute_curl($curl_handle) {
  $GLOBALS['response_body'] = curl_exec($curl_handle);
  $GLOBALS['response_header'] = curl_getinfo($curl_handle);
  $output_file = fopen(TMP_OUTPUT_FILE_PATH, "w");
  $cookie_file = fopen(COOKIE_FILE_PATH, "w");

  if (fwrite($output_file, output()) === false) {
    echo "Error writing to file: $output_file_path";
  }

  curl_close($curl_handle);
  fclose($output_file);
  fclose($cookie_file);
}

function curl_get($path) {
  $curl_handle = basic_curl_handle($path);
  execute_curl($curl_handle);
}

function curl_post($path, $data) {
  $curl_handle = basic_curl_handle($path);

  curl_setopt($curl_handle, CURLOPT_POST, true);
  curl_setopt($curl_handle, CURLOPT_POSTFIELDS, $data);

  execute_curl($curl_handle);
}

function output($key = 'response_body') {
  return $GLOBALS[$key];
}

function teardown() {
  unlink(TMP_OUTPUT_FILE_PATH);
  unlink(COOKIE_FILE_PATH);
}

function write_failure_to_file($test) {
  $output_file_path = FAILED_OUTPUT_DIR_PATH . $test . '.html';
  $output_file = fopen($output_file_path, "w");

  if (fwrite($output_file, output()) === false) {
    echo "Error writing to file: $output_file_path";
  }

  fclose($output_file);
}
