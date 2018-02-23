<?php

namespace Core;

class View
{

  const path = '/../app/views/';

  protected $helper;

  public function __construct($controller, $action)
  {
    $this->path = realpath(__DIR__ . self::path) . '/';
    $this->helper = new ViewHelper($controller, $action);
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

  public function renderJSON($data)
  {
      header("Content-Type: application/json");
      echo json_encode($data);
  }

  public function e($value)
  {
    echo htmlspecialchars($value);
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
