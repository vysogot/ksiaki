<?php

require __DIR__ . '/../app/lib/config.php';

$path = realpath(__DIR__ . "/migrations");
$files = scandir($path);

list($host, $dbname, $user, $pass, $port) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT']
];

exec("mysql -h $host -P $port -u $user --password=$pass -e \"create database if not exists $dbname\"");

foreach ($files as $file) {
    if ($file == '.' || $file == '..') continue;

    $realpath = $path . '/' . $file;
    $query = file_get_contents($realpath);

    if (exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath"))
         echo "$realpath => Success\n";
    else
         echo "$realpath => Fail\n";
}
