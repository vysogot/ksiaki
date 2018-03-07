<?php

namespace App\Controllers;

use App\Models\User;

class Session extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function new()
  {
    $this->render('session/new', ['name_or_email' => '']);
  }

  public function create()
  {
    $user = User::find(['name_or_email' => $_POST['name_or_email']]);

    if ($user && $user->authenticate($_POST['password'])) {
      $this->login($user);
      $this->notice('login_success');
      $this->redirect('home/index');
    } else {
      $this->warning('login_failure');
      $this->render('session/new', [
        'name_or_email' => $_POST['name_or_email'],
        'errors' => ["name_or_email" => "authentication_failed"]
      ]);
    }
  }

  public function destroy()
  {
    $this->logout();
    $this->render('session/destroy');
  }
}
