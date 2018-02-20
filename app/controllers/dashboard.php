<?php

namespace App\Controllers;

use Core\Auth;

class Dashboard extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
    //$this->session->ensureLoggedIn();
  }

  public function index()
  {
      $this->view->render('dashboard/index');
  }
}
