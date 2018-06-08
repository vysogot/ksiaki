<?php

require realpath(__DIR__ . '/../vendor/autoload.php');

ini_set('output_buffering', 1);

// set config.example.php and move it one folder up from the root folder
$envs = require realpath(__DIR__ . '/../../ksiaki_config.php');
$env = getenv('APPLICATION_ENV');
if (!$env) $env = 'development';
$GLOBALS['config'] = $envs[$env];

require realpath(__DIR__ . '/lib/error_handler.php');

if (isset($_SERVER['HTTP_HOST'])) {
  session_start();
  ini_set('session.cookie_httponly', 1);

  $GLOBALS['base_url'] = $GLOBALS['config']['protocol'] . $_SERVER['HTTP_HOST'];
  $GLOBALS['url'] = $GLOBALS['base_url'] . dirname($_SERVER['SCRIPT_NAME']) . '/';
}

// use include for custom error handling
include realpath(__DIR__ . '/lib/helpers.php');
include realpath(__DIR__ . '/lib/db.php');
include realpath(__DIR__ . '/lib/locals.php');
include realpath(__DIR__ . '/lib/validators.php');
include realpath(__DIR__ . '/lib/mailer.php');

$params = [];
$data = [];

$post = $_SERVER['REQUEST_METHOD'] === 'POST';
$get  = $_SERVER['REQUEST_METHOD'] === 'GET';
$xhr  = (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
  strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
