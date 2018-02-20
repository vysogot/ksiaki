<?php

namespace Core;

abstract class Model
{

  public function __construct($child)
  {
    if (!isset($child->id)) {
      $child->newRecord = true;
    } else {
      $child->newRecord = false;
    }
  }

}
