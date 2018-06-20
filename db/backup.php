<?php

require 'init.php';
$timestamp = date('Ymd_His', time());

list($host, $dbname, $user, $pass, $port, $backup_dir) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT'],
  $GLOBALS['config']['backup_dir']
];

exec("mysqldump -u$user $dbname --events --routines --single-transaction --complete-insert --no-create-db >> $backup_dir" . $timestamp . "_ksiaki_backup.sql");
