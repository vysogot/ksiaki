<?php

namespace App\Controllers;

class Hero extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function index()
  {
    $this->render('hero/index');
  }

  public function show()
  {
    $this->render('hero/show');
  }
}
