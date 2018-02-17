<?php

namespace Core;

abstract class Controller
{

  protected $view;
  protected $session;
  protected $csrf;

  public function __construct($controller, $action)
  {
    $url = Config::get('URL');
    $this->session = new Session;
    $this->csrf = new Csrf($this->session);

    if ($this->session->isUserLoggedIn() && Request::cookie('remember_me')) {
        header('location: ' . $url . 'login/loginWithCookie');
    }

    $this->view = new View($url, $this->session, $controller, $action);
  }

  public function redirectTo($path)
  {
    header("location: " . Config::get('URL') . $path);
  }
}
