<?php

$envs = include realpath(__DIR__ . '/../../ksiaki_config.php');

$env = getenv('APPLICATION_ENV');
$config = empty($env) ? $envs['development'] : $envs[$env];

list($host, $dbname, $user, $pass, $port) = [
  $config['DB_HOST'],
  $config['DB_NAME'],
  $config['DB_USER'],
  $config['DB_PASS'],
  $config['DB_PORT']
];

if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"DROP DATABASE IF EXISTS $dbname\"")) {
  echo "\nDatabase '$dbname' dropped if existed\n";
}

if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_polish_ci\"")) {
  echo "Database '$dbname' created\n\n";
}

$path = realpath(__DIR__ . "/migrations");
$files = scandir($path);

foreach ($files as $file) {
    if (!fnmatch('*.sql', $file)) continue;

    $realpath = $path . '/' . $file;
    $query = file_get_contents($realpath);

    if (exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath"))
         echo "$file => Success\n";
    else
         echo "$file => Fail\n";
}
