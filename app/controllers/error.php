<?php

namespace App\Controllers;

class Error extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function error404()
  {
      header('HTTP/1.0 404 Not Found', true, 404);
      $this->render('error/404');
  }
}
