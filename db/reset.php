<?php

require 'init.php';

list($host, $dbname, $user, $pass, $port) = [
  $GLOBALS['config']['DB_HOST'],
  $GLOBALS['config']['DB_NAME'],
  $GLOBALS['config']['DB_USER'],
  $GLOBALS['config']['DB_PASS'],
  $GLOBALS['config']['DB_PORT']
];

if (in_array($env, ['development', 'testing'])) {

    if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"DROP DATABASE IF EXISTS $dbname\"")) {
      echo "\nDatabase '$dbname' dropped if existed\n";
    }

    if (!exec("mysql -h $host -P $port -u $user --password=$pass -e \"CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_polish_ci\"")) {
      echo "Database '$dbname' created\n\n";
    }

    run_scripts_in_folder('installs');
    run_scripts_in_folder('procedures');
    run_scripts_in_folder('migrations');
    run_scripts_in_folder('indexes');
    run_scripts_in_folder('seeds');

    echo "\nReset db '$dbname' completed\n\n";

} else {

    echo "\nCan't run in '$env', do it manually or use 'db/migrate.php'\n\n";

}
