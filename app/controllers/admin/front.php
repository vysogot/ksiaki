<?php

namespace App\Controllers\Admin;

use Core\Auth;

abstract class Front extends \App\Controllers\Front
{
  public function __construct()
  {
      parent::__construct();
      Auth::checkAuthentication();
  }
}
