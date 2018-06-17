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

$schema_filename = realpath(__DIR__ . '/db/installs/000_schema.sql');
$schema_version_filename = realpath(__DIR__ . '/db/installs/001_schema_version.sql');

exec("mysqldump -u$user --databases $dbname --single-transaction --no-data > $schema_filename");
exec("mysqldump --single-transaction --no-create-db --no-create-info -u$user $dbname schema_version > $schema_version_filename");
