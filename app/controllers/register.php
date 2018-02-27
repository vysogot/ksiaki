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

  public function new()
  {
    $user = new Model;
    $this->render('register/new', ['user' => $user]);
  }

  public function create()
  {
    $user = new Model($_POST);

    if ($user->save()) {
      $this->redirect('home/index');
    } else {
      $this->render('register/new', ['user' => $user]);
    }
  }
}
