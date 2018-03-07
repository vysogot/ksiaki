<?php

namespace Core;

use App\Config;
use App\Models\User;

abstract class Controller
{

  public $current_user;
  private $view;

  public function before() {}
  public function after() {}

  public function __construct($controller, $action)
  {

    if (isset($_SESSION['user_id'])) {
      $this->current_user = User::find($_SESSION['user_id']);
    }

    $this->view = new View($controller, $action);
  }

  public function render($filename, $data = null)
  {
    $this->view->render($filename, $data);
  }

  public function renderJSON($data = null)
  {
    $this->view->renderJSON($data);
  }

  public function renderGame($name, $data = null)
  {
    $this->view->renderGame($name, $data);
  }

  public function redirect($path)
  {
    header("location: " . Config::url() . $path);
  }

  public function notice($message)
  {
    $this->flash($message, 'notice');
  }

  public function warning($message)
  {
    $this->flash($message, 'warning');
  }

  public function login($user)
  {
    session_regenerate_id(true);
    $_SESSION['user_id'] = $user->id;
  }

  public function logout()
  {
    $_SESSION = array();

    if (isset($_COOKIE[session_name()])) {
       setcookie(session_name(), '', time()-42000, '/');
    }

    unset($this->current_user);

    session_destroy();
  }

  public function redirectLoggedOut()
  {
    if (isset($_SESSION['user_id'])) {
      return true;
    } else {
      header("location: " . Config::url() . 'session/new');
    }
  }

  private function flash($message, $type)
  {
    if (!isset($_SESSION['flashes'])) {
      $_SESSION['flashes'] = [];
    }

    $_SESSION['flashes'][$type] = $message;
  }
}
