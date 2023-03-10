<?php

require 'support/env.php';
require 'support/db.php';

$timestamp = date('Ymd_His', time());

list($host, $dbname, $user, $pass, $port) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT']
];

exec("mysqldump -u$user $dbname --opt --where=\"1 limit 100\" --single-transaction --complete-insert --no-create-db --no-create-info > " . SQL_SEED_FILE_PATH);

$sql = file_get_contents(SQL_SEED_FILE_PATH);
$sql = preg_replace('#INSERT INTO `([_a-z]+)`#', 'TRUNCATE TABLE `$1`; INSERT INTO `$1`', $sql);

// set password to all users: 12345678
$sql = preg_replace('#\$2y\$10\$([^\']+)\'#', '\$2y\$10\$uXDAbq/ZeoXz4kER94Y45.TIYe1helT3cp705KmtZ/DeLd7QaNUoe\'', $sql);
file_put_contents(SQL_SEED_FILE_PATH, $sql);