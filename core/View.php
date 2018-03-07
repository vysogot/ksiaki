<?php

namespace Core;

class View
{

  const appViewsPath = '/../app/views/';
  const gamesPath = '/../games/';

  private $path;
  private $gamesPath;

  protected $helper;
  protected $current_user;

  public function __construct($controller, $action)
  {
    $this->path = realpath(__DIR__ . self::appViewsPath) . '/';
    $this->gamesPath = realpath(__DIR__ . self::gamesPath) . '/';
    $this->helper = new ViewHelper($controller, $action);
    $this->current_user = $controller->current_user;

    $this->flashes = $_SESSION['flashes'] ?? [];
    unset($_SESSION['flashes']);
  }

  public function render($filename, $data = null)
  {
      $this->bind($data);
      $partial = $this->path . $filename . '.php';

      require $this->path . '_templates/layout.php';
  }

  public function renderPartial($filename, $data = null)
  {
      $this->bind($data);
      require $this->path . $filename . '.php';
  }

  public function renderGame($name, $data = null)
  {
      $this->bind($data);
      require $this->gamesPath . $name . '/index.html';
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
        $this->{$key} = $value;
      }
    }
  }
}
