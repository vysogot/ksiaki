<?php

namespace Core;

class View
{

  //protected $session;
  protected $url;
  protected $controller;
  protected $action;
  protected $helper;
  //protected $csrf;

  private $path;

  public function __construct($controller, $action)
  {
    $this->url = \App\Config::url();
    $this->controller = $controller;
    $this->action = $action;
    //$this->current_user = new \App\Models\User;

    $this->helper = new ViewHelper($controller, $action);
    //$this->csrf = new Csrf($session);

    $this->path = realpath(__DIR__ . '/../app/views/');
    $this->path .= '/';
  }

  public function render($filename, $data = null)
  {
      $this->bind($data);

      require $this->path . '_templates/header.php';
      require $this->path . $filename . '.php';
      require $this->path . '_templates/footer.php';
  }

  public function renderPartial($filename, $data = null)
  {
      $this->bind($data);
      require $this->path . $filename . '.php';
  }

  public function renderJSON($data)
  {
      header("Content-Type: application/json");
      echo json_encode($data);
  }

  private function bind($data = null)
  {
    if ($data) {
        foreach ($data as $key => $value) {
            $this->{$key} = htmlspecialchars($value);
        }
    }
  }
}
