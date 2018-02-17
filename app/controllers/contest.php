<?php

namespace App\Controllers;

class Contest extends Front
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
        $this->View->render('contest/index');
    }

    public function show()
    {
        $this->View->render('contest/show');
    }

    public function preroll()
    {
        $this->View->render('contest/preroll');
    }

    public function play()
    {
        $this->View->render('contest/play');
    }
}
