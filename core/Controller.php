<?php

namespace Core;

use App\Config;
use App\Models\User;

abstract class Controller
{

  private $view;
  public $current_user;

  public function __construct($controller, $action)
  {
    if (isset($_SESSION['user_id'])) {
      $this->current_user = User::find($_SESSION['user_id']);
    }

    $this->view = new View($controller, $action);
  }

  public function redirect($path)
  {
    header("location: " . Config::url() . $path);
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
}
