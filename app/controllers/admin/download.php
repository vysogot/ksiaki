<?php

namespace App\Controllers\Admin;

class Download extends Front
{
  
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

  public function index()
  {
      $this->render('admin/download/index');
  }
}
