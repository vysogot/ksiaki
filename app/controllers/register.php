<?php

namespace App\Controllers;

use App\Models\User;

class Register extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
    $this->view->render('register/index');
  }

  public function create()
  {
    User::create($_POST);
  }
}
