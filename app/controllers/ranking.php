<?php

namespace App\Controllers;

class Ranking extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function index()
  {
      $this->render('ranking/index');
    }
}
