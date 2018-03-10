<?php

require realpath(__DIR__ . '/lib/config.php');
require realpath(__DIR__ . '/lib/helpers.php');
require realpath(__DIR__ . '/lib/db.php');

$params = [];
$errors = [];
$data = [];

$post = $_SERVER['REQUEST_METHOD'] === 'POST';

$url = '';
$base_url = '';
