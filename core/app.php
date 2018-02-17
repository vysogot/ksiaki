<?php

namespace Core;

class App
{

  private $router;

  public function __construct($url)
  {
    $this->router = new Router($url);
  }

  public function dispatch()
  {
    call_user_func_array(
      array($this->router->controller, $this->router->action),
      $this->router->parameters
    );
  }

}
