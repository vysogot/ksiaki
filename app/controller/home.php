<?php

namespace App\Controller;

class Home extends Front
{
    /**
     * Construct this object by extending the basic Controller class
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Handles what happens when user moves to URL/index/index - or - as this is the default controller, also
     * when user moves to /index or enter your application at base level
     */
    public function index()
    {
        $this->View->render('home/index');
    }

    public function adstest()
    {
        $this->View->renderWithoutHeaderAndFooter('home/adstest');
    }
}
