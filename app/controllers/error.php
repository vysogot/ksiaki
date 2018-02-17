<?php

namespace App\Controllers;

class Error extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function error404()
  {
      header('HTTP/1.0 404 Not Found', true, 404);
      $this->view->render('error/404');
  }
}
