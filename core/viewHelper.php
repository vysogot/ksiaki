<?php

namespace Core;

class ViewHelper
{

  protected $controller;
  protected $action;

  public function __construct($controller, $action)
  {
    $this->controller = $controller;
    $this->action = $action;
  }

  public function isActive($controller_name)
  {
    return ($this->controller == $controller_name);
  }

}
