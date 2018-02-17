<?php

namespace App\Controllers\Admin;

class Download extends Front
{
  
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
      $this->view->render('admin/download/index');
  }
}
