<?php

namespace App\Controllers;

class Contest extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
      $this->view->render('contest/index');
  }

  public function show()
  {
      $this->view->render('contest/show');
  }

  public function preroll()
  {
      $this->view->render('contest/preroll');
  }

  public function play()
  {
      $this->view->render('contest/play');
  }
}
