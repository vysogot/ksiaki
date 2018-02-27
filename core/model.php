<?php

namespace Core;

abstract class Model
{

  //protected $errors;

  public function __construct($params)
  {

    foreach ($params as $key => $value) {
        $this->{$key} = $value;
    }

    $this->newRecord = !isset($this->id);

  }

  public static function build($params)
  {
    if (empty($params)) return null;

    if (is_array($params)) {
      return self::buildMany($params);
    } else {
      return self::buildOne($params);
    }
  }

  private static function buildOne($params)
  {
    return new static($params);
  }

  private static function buildMany($params)
  {

    $objects = [];

    foreach($params as $object) {
      array_push($objects, new static($object));
    }

    return $objects;
  }

}
