<?php

function execute($sql, $fields, $all = false, $num = false)
{
  $dbc = get_connection($num);
  $query = $dbc->prepare($sql);

  foreach ($fields as $field) {
    list($name, $value, $type) = $field;
    $query->bindValue(':' . $name, $value, $type);
  }

  try {
    $query->execute();
  } catch(PDOException $e) {
    exit('Error execute query');
  }

  $ret = $query->fetchAll();

  if ($all || empty($ret)) return $ret;
  return $ret[0];

}

function get_connection($num = false)
{

  if (!isset($GLOBALS['db_connection'])) {

    try {
        $options = array(
          PDO::ATTR_DEFAULT_FETCH_MODE => (($num == true)?PDO::FETCH_NUM:PDO::FETCH_OBJ),
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
