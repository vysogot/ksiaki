<?php

namespace App\Controllers\Admin;

class Hero extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

    /**
     * Handles what happens when user moves to URL/hero/index - or - as this is the default controller, also
     * when user moves to /index or enter your application at base level
     */
    public function index()
    {
        $this->view->render('admin/hero/index');
    }

    public function new()
    {
        $this->view->render('admin/hero/new');
    }

    public function create()
    {
        $this->view->render('admin/hero/show');
    }

    public function edit()
    {
        $this->view->render('admin/hero/edit');
    }

    public function update()
    {
        $this->view->render('admin/hero/show');
    }

    public function destroy()
    {
        $this->view->render('admin/hero/index');
    }
}
