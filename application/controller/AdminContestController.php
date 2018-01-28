<?php

class AdminContestController extends Controller
{
    /**
     * Construct this object by extending the basic Controller class
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Handles what happens when user moves to URL/contest/index - or - as this is the default controller, also
     * when user moves to /index or enter your application at base level
     */
    public function index()
    {
        $this->View->render('admin/contest/index');
    }

    public function prepare()
    {
        $this->View->render('admin/contest/prepare');
    }

    public function create()
    {
        $this->View->render('admin/contest/show');
    }

    public function edit()
    {
        $this->View->render('admin/contest/edit');
    }

    public function update()
    {
        $this->View->render('admin/contest/show');
    }

    public function destroy()
    {
        $this->View->render('admin/contest/index');
    }
}
