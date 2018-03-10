<?php

$config = array(
  'DB_TYPE' => 'mysql',
  'DB_HOST' => '127.0.0.1',
  'DB_NAME' => 'ksiaki',
  'DB_USER' => 'root',
  'DB_PASS' => '',
  'DB_PORT' => '3306',
  'DB_CHARSET' => 'utf8'
);

if (isset($_SERVER['HTTP_HOST'])) {
  session_start();
  error_reporting(E_ALL);
  ini_set("display_errors", 1);
  ini_set('session.cookie_httponly', 1);
  $base_url = 'http://' . $_SERVER['HTTP_HOST'];
  $url = $base_url . str_replace('public', '', dirname($_SERVER['SCRIPT_NAME']));
}

if (getenv('APPLICATION_ENV') == 'production') {
  $config = array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '127.0.0.1',
    'DB_NAME' => 'ksiaki',
    'DB_USER' => 'root',
    'DB_PASS' => 'production',
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8'
  );
}
