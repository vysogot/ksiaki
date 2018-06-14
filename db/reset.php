<?php

$envs = include realpath(__DIR__ . '/../../ksiaki_config.php');

$env = getenv('APPLICATION_ENV');
if (!$env) $env = 'development';
$GLOBALS['config'] = $envs[$env];

list($host, $dbname, $user, $pass, $port) = [
  $config['DB_HOST'],
  $config['DB_NAME'],
  $config['DB_USER'],
  $config['DB_PASS'],
  $config['DB_PORT']
];

$match = '*.sql';

if (in_array($env, ['development', 'testing'])) {

    if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"DROP DATABASE IF EXISTS $dbname\"")) {
      echo "\nDatabase '$dbname' dropped if existed\n";
    }

    if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_polish_ci\"")) {
      echo "Database '$dbname' created\n\n";
    }

} else {
    echo "\nRunning in '$env' – SAFE MODE schema and data unchanged\n\n";
    $match = '1*sp*.sql';
}

$path = realpath(__DIR__ . "/migrations");
$files = scandir($path);

foreach ($files as $file) {
    if (!fnmatch($match, $file)) continue;

    $realpath = $path . '/' . $file;
    $query = file_get_contents($realpath);

    if (exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath"))
         echo "$file => Success\n";
    else
         echo "$file => Fail\n";
}

echo "\nCompleted\n";
