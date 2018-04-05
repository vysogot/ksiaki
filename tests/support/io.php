<?php

const FAILED_OUTPUT_DIR = 'tests/output/';
const TMP_OUTPUT = 'tests/output/tmp.html';
const COOKIE_FILE = 'tests/output/cookie.txt';

function basic_curl_handle($path) {
  $curl_handle = curl_init($GLOBALS['config']['TESTING_BASE_URL'] . $path);

  curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($curl_handle, CURLOPT_HEADER, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYPEER, 0);
  curl_setopt($curl_handle, CURLOPT_COOKIEJAR, COOKIE_FILE);
  curl_setopt($curl_handle, CURLOPT_COOKIEFILE, COOKIE_FILE);
  curl_setopt($curl_handle, CURLOPT_HTTPHEADER, ['Accept-Language: pl']);

  return $curl_handle;
}

function execute_curl($curl_handle) {
  $response = curl_exec($curl_handle);
  $output_file = fopen(TMP_OUTPUT, "w");

  if ($response === false) {
    echo 'Curl error: ' . curl_error($curl_handle) . "\n";
  } else {
    if (fwrite($output_file, $response) === false) {
      echo "Error writing to file: $output_file_path";
    }
  }

  curl_close($curl_handle);
  fclose($output_file);
}

function curl_get($path) {
  $curl_handle = basic_curl_handle($path);
  execute_curl($curl_handle);
}

function curl_post($path, $data) {
  $curl_handle = basic_curl_handle($path);

  curl_setopt($curl_handle, CURLOPT_POST, true);
  curl_setopt($curl_handle, CURLOPT_POSTFIELDS, $data);
  curl_setopt($curl_handle, CURLOPT_FOLLOWLOCATION, true);

  execute_curl($curl_handle);
}

function output() {
  return file_get_contents(TMP_OUTPUT);
}

function teardown() {
  unlink(TMP_OUTPUT);
  unlink(COOKIE_FILE);
}

function failed_test_output($test) {
  $output_file_path = FAILED_OUTPUT_DIR . $test . '.html';
  $output_file = fopen($output_file_path, "w");

  if (fwrite($output_file, output()) === false) {
    echo "Error writing to file: $output_file_path";
  }

  fclose($output_file);
}
