<?php

$envs = include realpath(__DIR__ . '/../../ksiaki_config.php');

$env = getenv('APPLICATION_ENV');
if (!$env) $env = 'development';
$GLOBALS['config'] = $envs[$env];

function run_scripts_in_folder($folder) {

    list($host, $dbname, $user, $pass, $port) = [
      $GLOBALS['config']['DB_HOST'],
      $GLOBALS['config']['DB_NAME'],
      $GLOBALS['config']['DB_USER'],
      $GLOBALS['config']['DB_PASS'],
      $GLOBALS['config']['DB_PORT']
    ];

    $path = realpath(__DIR__ . "/$folder");
    $files = scandir($path);

    echo "\n--- Running scripts in '$folder' ---\n\n";

    foreach ($files as $file) {
        if (!fnmatch('*.sql', $file)) continue;

        $realpath = $path . '/' . $file;
        $query = file_get_contents($realpath);

        $result = '';

        if ($GLOBALS['env'] == 'development') {
            $result = exec("mysql -h $host -P $port -u $user --password=$pass $dbname < $realpath");
        } else {
            $result = exec("mysql -h $host -P $port -u $user $dbname < $realpath");
        }

        if ($result == '2')
             echo "$file => Skipping\n";
        else
             echo "$file => Success\n";
    }

    echo "\nCompleted $folder\n";
}
