<?php

require realpath(__DIR__ . '/../../app/lib/db.php');

const SQL_TRUNCATE_FILE_PATH = 'db/seeds/000_truncate.sql';
const SQL_SEED_FILE_PATH = 'db/seeds/20180620182933_ksiaki_backup_data_only.sql';

function last_inserted_in($tablename) {
    return execute("SELECT * FROM $tablename ORDER BY id DESC LIMIT 1", []);
}

function db_seed() {
  list($host, $dbname, $user, $pass, $port) = [
    $GLOBALS['config']['DB_HOST'],
    $GLOBALS['config']['DB_NAME'],
    $GLOBALS['config']['DB_USER'],
    $GLOBALS['config']['DB_PASS'],
    $GLOBALS['config']['DB_PORT']
  ];

  exec("mysql -h $host -P $port -u $user --password=$pass $dbname < " . SQL_TRUNCATE_FILE_PATH);
  exec("mysql -h $host -P $port -u $user --password=$pass $dbname < " . SQL_SEED_FILE_PATH);
}
