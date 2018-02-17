<?php

namespace App\Controllers;

class Home extends Front
{

    public function __construct($action)
    {
        parent::__construct(self::class, $action);
    }

    public function index()
    {
        $this->view->render('home/index');
    }

    public function adstest()
    {
        $this->view->renderWithoutHeaderAndFooter('home/adstest');
    }
}
