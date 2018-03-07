<?php

namespace App\Controllers\Admin;

use App\Models\User;

class Dashboard extends Front
{

    public function __construct($action)
    {
      parent::__construct($this, $action);
    }

    public function index()
    {
      $users = User::all();
      $this->render('admin/dashboard/index', ['users' => $users]);
    }

}
