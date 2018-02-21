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
    $user = new User($_POST);

    if ($user->save()) {
      $this->redirect('home/index');
    } else {
      $this->view->render('register/index');
    }
  }
}
