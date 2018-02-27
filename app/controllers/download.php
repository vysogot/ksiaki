<?php

namespace App\Controllers;

class Download extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function index()
  {
      $this->render('download/index');
  }
}
