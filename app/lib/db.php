<?php

function fetch_all($statement, $arguments = [], $options = []) {
    return execute($statement, $arguments, true, $options);
}

function fetch_one($statement, $arguments = [], $options = []) {
    return execute($statement, $arguments, false, $options);
}

function execute($statement, $arguments = [], $all = false, $options = []) {

  $connection = get_connection($options);
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

function get_connection($query_options = [])
{

  $defaults = [
    'fetch_type' => PDO::FETCH_OBJ
  ];

  $query_options = array_merge($defaults, $query_options);

  $needs_refresh = (!isset($GLOBALS['db_connection']) ||
        (isset($GLOBALS['db_connection_options']) &&
        ($GLOBALS['db_connection_options'] != $query_options)));

  if ($needs_refresh) {

    try {

        $GLOBALS['db_connection_options'] = $query_options;

        $connection_options = array(
          PDO::ATTR_DEFAULT_FETCH_MODE => $query_options['fetch_type'],
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
          $connection_options
         );

    } catch (PDOException $e) {
        echo 'Database connection can not be estabilished. Please try again later.' . '<br>';
        echo 'Error code: ' . $e->getCode();
        exit;
    }

  }

  return $GLOBALS['db_connection'];

}
