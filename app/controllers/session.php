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
      session_regenerate_id(true);
      $_SESSION['user_id'] = $user->id;
      $this->redirect('/home/index');
    } else {
      $this->render('session/new', [
        'name_or_email' => $_POST['name_or_email'],
        'errors' => ["name_or_email" => "authentication_failed"]
      ]);
    }
  }

  public function destroy()
  {
    $_SESSION = array();

    if (isset($_COOKIE[session_name()])) {
       setcookie(session_name(), '', time()-42000, '/');
    }

    session_destroy();

    $this->redirect('home/index');
  }
}
