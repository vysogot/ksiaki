<?php

namespace Core;

abstract class Model
{

  //protected $errors;

  public function __construct($child)
  {
    $child->newRecord = !isset($child->id);
  }

  public static function build($params)
  {
    if (empty($params)) return null;

    $objects = [];

    if (is_array($params)) {
      foreach($params as $object) {
        array_push($objects, new static($object));
      }
      return $objects;
    } else {
      return new static($params);
    }
  }

}
