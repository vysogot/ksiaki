<?php

namespace Core;

class View
{

  protected $session;
  protected $url;
  protected $controller;
  protected $action;
  protected $helper;
  protected $csrf;

  public function __construct($url, $session, $controller, $action)
  {
    $this->url = $url;
    $this->session = $session;
    $this->controller = $controller;
    $this->action = $action;

    $this->helper = new ViewHelper($controller, $action);
    $this->csrf = new Csrf($session);
  }

  public function render($filename, $data = null)
  {
      if ($data) {
          foreach ($data as $key => $value) {
              $this->{$key} = $value;
          }
      }

      require Config::get('PATH_VIEW') . '_templates/header.php';
      require Config::get('PATH_VIEW') . $filename . '.php';
      require Config::get('PATH_VIEW') . '_templates/footer.php';
  }

  public function renderPartial($filename, $data = null)
  {
      if ($data) {
          foreach ($data as $key => $value) {
              $this->{$key} = $value;
          }
      }

      require Config::get('PATH_VIEW') . $filename . '.php';
  }

  public function renderJSON($data)
  {
      header("Content-Type: application/json");
      echo json_encode($data);
  }

  public function renderFeedbackMessages()
  {
    require Config::get('PATH_VIEW') . '_templates/feedback.php';

    $this->session->set('feedback_positive', null);
    $this->session->set('feedback_negative', null);
  }

  public function encodeHTML($str)
  {
      return htmlentities($str, ENT_QUOTES, 'UTF-8');
  }
}
