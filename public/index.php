<?php

require '../vendor/autoload.php';

function e($value) {
  return htmlspecialchars($value);
}

App\Config::setEnvironment(getenv('APPLICATION_ENV'));

if (!isset($_GET['url'])) $_GET['url'] = '';

$router = new Core\Router($_GET['url']);
$router->dispatch();
