<?php

namespace App\Controllers;

class Ranking extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
      $this->view->render('ranking/index');
    }
}
