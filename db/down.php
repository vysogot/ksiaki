<?php

require __DIR__ . '/../app/lib/config.php';

list($host, $dbname, $user, $pass, $port) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT']
];

exec("mysql -h $host -P $port -u $user --password=$pass -e \"drop database if exists $dbname\"");
