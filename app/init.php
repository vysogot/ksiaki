<?php

require realpath(__DIR__ . '/lib/config.php');
require realpath(__DIR__ . '/lib/helpers.php');
require realpath(__DIR__ . '/lib/db.php');
require realpath(__DIR__ . '/lib/locals.php');

$params = [];
$errors = [];
$data = [];

$url = '';
$base_url = '';

$post = $_SERVER['REQUEST_METHOD'] === 'POST';
