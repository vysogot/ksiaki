<?php

ini_set('output_buffering', 1);

require realpath(__DIR__ . '/lib/error_handler.php');
require realpath(__DIR__ . '/lib/config.php');
require realpath(__DIR__ . '/lib/helpers.php');
require realpath(__DIR__ . '/lib/db.php');
require realpath(__DIR__ . '/lib/locals.php');

$params = [];
$errors = [];
$data = [];

$post = $_SERVER['REQUEST_METHOD'] === 'POST';
