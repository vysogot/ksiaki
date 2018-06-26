<?php

function fetch_all($statement, $arguments = []) {
    return execute($statement, $arguments, true);
}

function execute($statement, $arguments = [], $all = false) {

  $connection = get_connection();
  $prepared_statement = $connection->prepare($statement);

  foreach ($arguments as $argument) {
    list($name, $value, $type) = $argument;
    $prepared_statement->bindValue(':' . $name, $value, $type);
  }

  try {

    $time_start = microtime(true);

    $prepared_statement->execute();

    $time_end = microtime(true);

  } catch(PDOException $e) {

    exit('Error execute query');

  }

  $execution_time = number_format((($time_end - $time_start)/60)*1000, 6);
  logger('db', $statement . ' execution time: ' . $execution_time . 'ms', $arguments);

  if ($all) {
      return $prepared_statement->fetchAll();
  } else {
      return $prepared_statement->fetch();
  }

}

function get_connection()
{

  if (!isset($GLOBALS['db_connection'])) {

    try {
        $options = array(
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
          PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
          PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
        );

        $GLOBALS['db_connection'] = new PDO(
          $GLOBALS['config']['DB_TYPE'] .
            ':host='    . $GLOBALS['config']['DB_HOST'] .
            ';dbname='  . $GLOBALS['config']['DB_NAME'] .
            ';port='    . $GLOBALS['config']['DB_PORT'] .
            ';charset=' . $GLOBALS['config']['DB_CHARSET'],
          $GLOBALS['config']['DB_USER'],
          $GLOBALS['config']['DB_PASS'],
          $options
         );

    } catch (PDOException $e) {
        echo 'Database connection can not be estabilished. Please try again later.' . '<br>';
        echo 'Error code: ' . $e->getCode();
        exit;
    }

  }

  return $GLOBALS['db_connection'];

}
