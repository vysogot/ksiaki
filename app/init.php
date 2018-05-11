<?php

ini_set('output_buffering', 1);

// the only 'require' is used here as for proper error handling
require realpath(__DIR__ . '/lib/error_handler.php');

// set config.example.php and move it one folder up from the root folder
$envs = include realpath(__DIR__ . '/../../ksiaki_config.php');
$env = getenv('APPLICATION_ENV');
$GLOBALS['config'] = empty($env) ? $envs['development'] : $envs[$env];

if (isset($_SERVER['HTTP_HOST'])) {
  session_start();
  ini_set('session.cookie_httponly', 1);

  $GLOBALS['base_url'] = 'https://' . $_SERVER['HTTP_HOST'];
  //$GLOBALS['base_url'] = 'http://' . $_SERVER['HTTP_HOST'];
  $GLOBALS['url'] = $GLOBALS['base_url'] . dirname($_SERVER['SCRIPT_NAME']) . '/';
}

include realpath(__DIR__ . '/lib/helpers.php');
include realpath(__DIR__ . '/lib/db.php');
include realpath(__DIR__ . '/lib/locals.php');
include realpath(__DIR__ . '/lib/validators.php');

$params = [];
$errors = [];
$data = [];

$post = $_SERVER['REQUEST_METHOD'] === 'POST';
