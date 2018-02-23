<?php

namespace App\Controllers;

use App\Models\User;
use Core\View;

class Session extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
    $this->render('session/index');
  }

  public function create()
  {
    $user = User::find(["name_or_email" => $_POST['name_or_email']]);

    if ($user && $user->authenticate($_POST['password'])) {
      $this->redirect('/home/index');
    } else {
      $this->render('session/index');
    }
  }

  public function destroy()
  {
      session_destroy();
      redirectTo('home/index');
  }
}
