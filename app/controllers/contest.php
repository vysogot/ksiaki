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
      $this->render('contest/index');
  }

  public function show()
  {
      $this->render('contest/show');
  }

  public function preroll()
  {
      $this->render('contest/preroll');
  }

  public function play()
  {
      $this->render('contest/play');
  }
}
