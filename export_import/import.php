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

$path = realpath(__DIR__ . "/imports");
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
