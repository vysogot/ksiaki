<?php

namespace Core;

use \PDO;
use \PDOException;

use App\Config;

class DatabaseFactory
{

  protected $connection;

  public function __construct()
  {

  }

  public function execute($sql, $fields, $all=false)
  {
    $dbc = $this->getConnection();
    $query = $dbc->prepare($sql);

    foreach ($fields as $field) {
      list($name, $value, $type) = $field;
      $query->bindParam(':' . $name, $value, $this->pdoParam($type));
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

  private function pdoParam($key)
  {
    return array(
      'int' => PDO::PARAM_INT,
      'str' => PDO::PARAM_STR,
      'bool' => PDO::PARAM_BOOL
    )[$key];
  }

  private function getConnection()
  {

    if (!$this->connection) {

      try {
          $options = array(
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
          );

          $this->connection = new PDO(
            Config::get('DB_TYPE') .
              ':host='    . Config::get('DB_HOST') .
              ';dbname='  . Config::get('DB_NAME') .
              ';port='    . Config::get('DB_PORT') .
              ';charset=' . Config::get('DB_CHARSET'),
            Config::get('DB_USER'),
            Config::get('DB_PASS'),
            $options
           );

      } catch (PDOException $e) {
          echo 'Database connection can not be estabilished. Please try again later.' . '<br>';
          echo 'Error code: ' . $e->getCode();
          exit;
      }

    }

    return $this->connection;
  }
}
