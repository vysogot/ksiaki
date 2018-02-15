<?php

namespace App\Controller\Admin;

use Core\Auth;

class Front extends \App\Controller\Front
{
  public function __construct()
  {
      parent::__construct();
      Auth::checkAuthentication();
  }
}
