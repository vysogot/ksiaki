<?php

class AdminHeroController extends Controller
{
    /**
     * Construct this object by extending the basic Controller class
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Handles what happens when user moves to URL/hero/index - or - as this is the default controller, also
     * when user moves to /index or enter your application at base level
     */
    public function index()
    {
        $this->View->render('admin/hero/index');
    }

    public function new()
    {
        $this->View->render('admin/hero/new');
    }

    public function create()
    {
        $this->View->render('admin/hero/show');
    }

    public function edit()
    {
        $this->View->render('admin/hero/edit');
    }

    public function update()
    {
        $this->View->render('admin/hero/show');
    }

    public function destroy()
    {
        $this->View->render('admin/hero/index');
    }
}
