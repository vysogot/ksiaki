<?php

namespace App\Controllers\Admin;

class Home extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

    public function index()
    {
        $this->render('admin/home/index');
    }

    public function update()
    {
        $this->render('admin/home/index');
    }
}
