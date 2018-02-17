<?php

namespace App\Controllers;

abstract class Front extends \Core\Controller
{
  public function __construct($controller, $action)
  {
    parent::__construct($controller, $action);
  }
}
