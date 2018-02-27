<?php

namespace App\Controllers;

use Core\Auth;

class Dashboard extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
    //$this->session->ensureLoggedIn();
  }

  public function index()
  {
      $this->render('dashboard/index');
  }
}
