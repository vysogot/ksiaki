<?php

namespace Core;

use App\Config;

abstract class Controller
{

  public function __construct($controller, $action)
  {
    $this->view = new View($controller, $action);
  }

  public function redirect($path)
  {
    header("location: " . Config::url() . $path);
  }

  public function render($filename, $data = null)
  {
    $this->view->render($filename, $data);
  }
}
