<?php

require realpath(__DIR__ . '/../vendor/autoload.php');

use App\Config;

Config::setEnvironment(getenv('APPLICATION_ENV'));

list($host, $dbname, $user, $pass, $port) = [
  Config::get('DB_HOST'),
  Config::get('DB_NAME'),
  Config::get('DB_USER'),
  Config::get('DB_PASS'),
  Config::get('DB_PORT')
];

exec("mysql -h $host -P $port -u $user --password=$pass -e 'drop database if exists $dbname'");
