<?php

date_default_timezone_set('Europe/Warsaw');

ini_set('output_buffering', 1);
ini_set('session.use_only_cookies', 1);
ini_set('session.cookie_secure', 1);
ini_set('session.cookie_httponly', 1);

require realpath(__DIR__ . '/../vendor/autoload.php');

$env = empty(getenv('APPLICATION_ENV')) ? 'development' : getenv('APPLICATION_ENV');
$envs = require realpath(__DIR__ . '/../config/ksiaki.php');
$GLOBALS['config'] = $envs[$env];

require realpath(__DIR__ . '/lib/error_handler.php');

session_start();

$GLOBALS['base_url'] = $GLOBALS['config']['protocol'] . $GLOBALS['config']['domain'];
$GLOBALS['url'] = $GLOBALS['base_url'] . dirname($_SERVER['SCRIPT_NAME']) . '/';
$GLOBALS['cloud'] = 'https://res.cloudinary.com/rall/image/fetch/';

// use include for custom error handling
include realpath(__DIR__ . '/lib/helpers.php');
include realpath(__DIR__ . '/lib/db.php');
include realpath(__DIR__ . '/lib/locales.php');
include realpath(__DIR__ . '/lib/validators.php');
include realpath(__DIR__ . '/lib/mailer.php');

$params = [];
$data = [];

$post = $_SERVER['REQUEST_METHOD'] === 'POST';
$get  = $_SERVER['REQUEST_METHOD'] === 'GET';
$xhr  = (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
  strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');


// CSRF validation
if ($post && !is_testing_env()) {

    $token = $_POST['token'] ?? false;

    if ($token && hash_equals(get_csrf_token(), $token)) {

        set_csrf_token();

    } else {

        if ($xhr) {
            send_json(['errors' => ['NOT_A_FIELD' => ['message' => t('invalid_token')]]]); exit();
        } else {
            flash('warning', t('invalid_token'));
            redirect('/');
        }

    }
}
