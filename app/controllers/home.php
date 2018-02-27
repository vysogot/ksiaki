<?php

namespace App\Controllers;

use Core\View;

class Home extends Front
{

    public function __construct($action)
    {
        parent::__construct($this, $action);
    }

    public function index()
    {
        $this->render('home/index');
    }

    public function adstest()
    {
        $this->renderWithoutHeaderAndFooter('home/adstest');
    }
}
