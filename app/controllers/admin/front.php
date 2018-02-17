<?php

namespace App\Controllers\Admin;

use Core\Auth;

abstract class Front extends \App\Controllers\Front
{
  public function __construct($controller, $action)
  {
    parent::__construct(self::class, $action);
    $this->session->ensureLoggedIn();
  }
}
