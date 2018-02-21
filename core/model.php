<?php

namespace Core;

abstract class Model
{

  public function __construct($child)
  {
    $child->newRecord = !isset($child->id);
  }

}
