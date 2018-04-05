<?php

# check db/ksiaki_config.example.php
# move the config file one folder up from the root folder
$env = require realpath(__DIR__ . '/../../../ksiaki_config.php');

$env_name = getenv('APPLICATION_ENV');
$config = empty($env_name) ? $env['development'] : $env[$env_name];

$url = '';
$base_url = '';

if (isset($_SERVER['HTTP_HOST'])) {
  session_start();
  ini_set('session.cookie_httponly', 1);

  $base_url = 'https://' . $_SERVER['HTTP_HOST'];
  $url = $base_url . dirname($_SERVER['SCRIPT_NAME']) . '/';
}
