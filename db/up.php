<?php

require realpath(__DIR__ . '/../vendor/autoload.php');

use App\Config;

$path = realpath(__DIR__ . "/migrations");
$files = scandir($path);

Config::setEnvironment(getenv('APPLICATION_ENV'));

list($host, $dbname, $user, $pass, $port) = [
  Config::get('DB_HOST'),
  Config::get('DB_NAME'),
  Config::get('DB_USER'),
  Config::get('DB_PASS'),
  Config::get('DB_PORT')
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
