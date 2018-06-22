<?php

require realpath(__DIR__ . '/../vendor/autoload.php');

ini_set('output_buffering', 1);

// set config.example.php and move it one folder up from the root folder
$envs = require realpath(__DIR__ . '/../config/ksiaki.php');
$env = getenv('APPLICATION_ENV');
if (!$env) $env = 'development';
$GLOBALS['config'] = $envs[$env];

require realpath(__DIR__ . '/lib/error_handler.php');

// **PREVENTING SESSION HIJACKING**
// Prevents javascript XSS attacks aimed to steal the session ID
ini_set('session.cookie_httponly', 1);

// **PREVENTING SESSION FIXATION**
// Session ID cannot be passed through URLs
ini_set('session.use_only_cookies', 1);

// Uses a secure connection (HTTPS) if possible
// ini_set('session.cookie_secure', 1);

session_start();
ini_set('session.cookie_httponly', 1);

$GLOBALS['base_url'] = $GLOBALS['config']['protocol'] . $GLOBALS['config']['domain'];
$GLOBALS['url'] = $GLOBALS['base_url'] . dirname($_SERVER['SCRIPT_NAME']) . '/';

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

if ($post && !is_testing_env()) {
    if (!(isset($_POST['token']) && hash_equals(get_csrf_token(), $_POST['token']))) {
        if ($xhr) {
            send_json(['errors' => ['NOT_A_FIELD' => ['message' => t('invalid_token')]]]); exit();
        } else {
            flash('warning', t('invalid_token'));
            redirect('/');
        }
    } else {
        set_csrf_token();
    }
}
