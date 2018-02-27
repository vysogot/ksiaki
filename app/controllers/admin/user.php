<?php

namespace App\Controllers\Admin;

use App\Models\User as Model;

class User extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function index()
  {
      $this->render('user/index');
  }

}
