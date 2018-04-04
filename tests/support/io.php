<?php

const FAILED_OUTPUT_DIR = 'tests/output/';
const TMP_OUTPUT = 'tests/output/tmp.html';
const COOKIE_FILE = 'tests/output/cookie.txt';
const BASE_URL = 'https://ksiaki-test.www.jgodawa';

function curl_get($path) {
  $curl_handle = curl_init(BASE_URL . $path);
  $output_file = fopen(TMP_OUTPUT, "w");

  curl_setopt($curl_handle, CURLOPT_FILE, $output_file);
  curl_setopt($curl_handle, CURLOPT_HEADER, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYPEER, 0);
  curl_setopt($curl_handle, CURLOPT_COOKIEJAR, COOKIE_FILE);
  curl_setopt($curl_handle, CURLOPT_COOKIEFILE, COOKIE_FILE);
  curl_setopt($curl_handle, CURLOPT_HTTPHEADER, ['Accept-Language: pl']);

  if (curl_exec($curl_handle) === false) {
    echo 'Curl error: ' . curl_error($curl_handle) . "\n";
  }

  curl_close($curl_handle);
  fclose($output_file);
}

function curl_post($path, $data) {
  $curl_handle = curl_init(BASE_URL . $path);
  $output_file = fopen(TMP_OUTPUT, "w");

  curl_setopt($curl_handle, CURLOPT_HEADER, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($curl_handle, CURLOPT_SSL_VERIFYPEER, 0);
  curl_setopt($curl_handle, CURLOPT_HTTPHEADER, ['Accept-Language: pl']);
  curl_setopt($curl_handle, CURLOPT_COOKIEJAR, COOKIE_FILE);
  curl_setopt($curl_handle, CURLOPT_COOKIEFILE, COOKIE_FILE);

  curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($curl_handle, CURLOPT_POST, true);
  curl_setopt($curl_handle, CURLOPT_POSTFIELDS, $data);
  curl_setopt($curl_handle, CURLOPT_FOLLOWLOCATION, true);

  $response = curl_exec($curl_handle);

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

function output() {
  return file_get_contents(TMP_OUTPUT);
}

function teardown() {
  unlink(TMP_OUTPUT);
}

function failed_test_output($test) {
  $output_file_path = FAILED_OUTPUT_DIR . $test . '.html';
  $output_file = fopen($output_file_path, "w");

  if (fwrite($output_file, output()) === false) {
    echo "Error writing to file: $output_file_path";
  }

  fclose($output_file);
}
