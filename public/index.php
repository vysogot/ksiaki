<?php

$start = microtime(true);

require '../vendor/autoload.php';

function e(String $value) {
  return htmlspecialchars($value);
}

App\Config::setEnvironment(getenv('APPLICATION_ENV'));

if (!isset($_GET['url'])) $_GET['url'] = '';

$router = new Core\Router($_GET['url']);
$router->dispatch();

$end = microtime(true);
$creationtime = ($end - $start);
//printf("Page created in %.6f seconds.", $creationtime);
