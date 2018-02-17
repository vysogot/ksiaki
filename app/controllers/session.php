<?php

namespace App\Controllers;

use App\Models\User;

class Session extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
    $this->view->render('session/index');
  }

  public function create()
  {

    if ($this->csrf->isTokenValid()) {

      $user = User::find($_POST['name']);

      if (!empty($user) && $user->authenticate($_POST['password'])) {
          $this->redirectTo('home/index');
      } else {
        $this->view->render('session/index');
      }
    }
  }

  public function destroy()
  {
      User::logout();
      redirectTo('home/index');
  }
}
