<?php

namespace App\Controllers\Admin;

class Hero extends Front
{
  public function __construct($action)
  {
    parent::__construct($this, $action);
  }

    public function index()
    {
        $this->render('admin/hero/index');
    }

    public function new()
    {
        $this->render('admin/hero/new');
    }

    public function create()
    {
        $this->render('admin/hero/show');
    }

    public function edit()
    {
        $this->render('admin/hero/edit');
    }

    public function update()
    {
        $this->render('admin/hero/show');
    }

    public function destroy()
    {
        $this->render('admin/hero/index');
    }
}
