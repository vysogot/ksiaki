<?php

namespace Core;

class ViewHelper
{

  protected $controller;
  protected $action;

  public function __construct($controller, $action)
  {
    $this->controller = $controller;
    $this->action = $action;
  }

  public function isActive($controller_name)
  {
    return ($this->controller == $controller_name);
  }

  /**
  * Checks if the passed string is the currently active controller-action (=method).
  * Useful for handling the navigation's active/non-active link.
  *
  * @param string $filename
  * @param string $navigation_action
  *
  * @return bool Shows if the action/method is used or not
  */
  public static function checkForActiveAction($filename, $navigation_action)
  {
    $split_filename = explode("/", $filename);
    $active_action = $split_filename[1];

    if ($active_action == $navigation_action) {
        return true;
    }

    return false;
  }

  public static function checkForActiveControllerAndAction($filename, $navigation_controller_and_action)
  {
    $split_filename = explode("/", $filename);
    $active_controller = $split_filename[0];
    $active_action = $split_filename[1];

    $split_filename = explode("/", $navigation_controller_and_action);
    $navigation_controller = $split_filename[0];
    $navigation_action = $split_filename[1];

    if ($active_controller == $navigation_controller AND $active_action == $navigation_action) {
        return true;
    }

    return false;
  }
}
