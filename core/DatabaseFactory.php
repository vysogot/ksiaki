<?php

namespace Core;

use \PDO;
use \PDOException;

use App\Config;

abstract class DatabaseFactory
{

  const pdoParam = [
    'int' => PDO::PARAM_INT,
    'str' => PDO::PARAM_STR,
    'bool' => PDO::PARAM_BOOL
  ];

  protected static $connection;

  public static function execute($sql, $fields, $all = false)
  {
    $dbc = self::getConnection();
    $query = $dbc->prepare($sql);

    foreach ($fields as $field) {
      list($name, $value, $type) = $field;
      $query->bindValue(':' . $name, $value, self::pdoParam[$type]);
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

  protected static function build($class, $params)
  {
    return (empty($params)) ? null : new $class($params);
  }

  private static function getConnection()
  {

    if (!self::$connection) {

      try {
          $options = array(
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
          );

          self::$connection = new PDO(
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

    return self::$connection;
  }
}
