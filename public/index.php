<?php

require '../vendor/autoload.php';

App\Config::setEnvironment(getenv('APPLICATION_ENV'));

$router = new Core\Router($_GET['url']);
$router->dispatch();
