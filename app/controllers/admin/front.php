<?php

namespace App\Controllers\Admin;

abstract class Front extends \App\Controllers\Front
{
  public function __construct($controller, $action)
  {
    parent::__construct($this, $action);
    //$this->session->ensureLoggedIn();
  }
}
