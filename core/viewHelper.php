<?php

namespace Core;

class ViewHelper extends View
{

  protected $controller;
  protected $action;

  public function __construct($controller, $action)
  {
    $this->controller = $controller;
    $this->action = $action;
  }

  public function activeClass($controller_name)
  {
    if ($this->controller == $controller_name) printf(' class="active"');
  }

}
