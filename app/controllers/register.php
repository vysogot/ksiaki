<?php

namespace App\Controllers;

use App\Models\User as Model;
use Core\View;

class Register extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
    $this->render('register/index');
  }

  public function create()
  {
    $user = new Model($_POST);

    if ($user->save()) {
      $this->redirect('home/index');
    } else {
      $this->render('register/index');
    }
  }
}
