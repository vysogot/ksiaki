<?php

require __DIR__ . '/../app/lib/config.php';

list($host, $dbname, $user, $pass, $port) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT']
];

if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"drop database if exists $dbname\"")) {
  echo "\nDatabase '$dbname' dropped if existed\n";
}

if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"create database $dbname\"")) {
  echo "Database '$dbname' created\n\n";
}

$path = realpath(__DIR__ . "/migrations");
$files = scandir($path);

foreach ($files as $file) {
    if ($file == '.' || $file == '..') continue;

    $realpath = $path . '/' . $file;
    $query = file_get_contents($realpath);

    if (exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath"))
         echo "$file => Success\n";
    else
         echo "$file => Fail\n";
}
