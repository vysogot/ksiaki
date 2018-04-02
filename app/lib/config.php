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
    'DB_PASS' => getenv('DB_PASS'),
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8'
  );
}

if (getenv('APPLICATION_ENV') == 'testing') {
  $config = array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '127.0.0.1',
    'DB_NAME' => 'ksiaki_test',
    'DB_USER' => 'root',
    'DB_PASS' => getenv('DB_PASS'),
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8'
  );
}
