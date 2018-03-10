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

  protected function render($filename, $data = null)
  {
    $this->view->render($filename, $data);
  }

  protected function renderJSON($data = null)
  {
    $this->view->renderJSON($data);
  }

  protected function renderGame($name, $data = null)
  {
    $this->view->renderGame($name, $data);
  }

  protected function redirect($path)
  {
    header("location: " . Config::url() . $path);
  }

  protected function notice($message)
  {
    $this->flash($message, 'notice');
  }

  protected function warning($message)
  {
    $this->flash($message, 'warning');
  }

  protected function login($user)
  {
    session_regenerate_id(true);
    $_SESSION['user_id'] = $user->id;
  }

  protected function logout()
  {
    $_SESSION = array();

    if (isset($_COOKIE[session_name()])) {
       setcookie(session_name(), '', time()-42000, '/');
    }

    $this->current_user = null;

    session_destroy();
  }

  protected function redirectLoggedOut($path = 'session/new')
  {
    if (isset($_SESSION['user_id'])) {
      return true;
    } else {
      header("location: " . Config::url() . $path);
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
