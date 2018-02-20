<?php

namespace Core;

use App\Config;

abstract class Controller
{

  protected $csrf;
  protected $session;
  protected $view;

  public function __construct($controller, $action)
  {
    $url = Config::url();

    //$this->session = new Session;
    //$this->current_user = $this->session->current_user;
    //$this->csrf = new Csrf($this->session);
    $this->view = new View($url, $controller, $action);
  }

  public function redirectTo($path)
  {
    header("location: " . Config::get('URL') . $path);
  }
}
