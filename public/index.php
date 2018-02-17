<?php

require '../vendor/autoload.php';

$app = new Core\App($_GET['url']);
$app->dispatch();
