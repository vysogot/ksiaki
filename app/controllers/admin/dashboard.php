<?php

namespace App\Controllers\Admin;

use Core\Request;
use Core\Redirect;

use App\Models\Admin;
use App\Models\User;

class Dashboard extends Front
{

    public function __construct($action)
    {
      parent::__construct($this, $action);
    }

    public function index()
    {
        $this->render('admin/dashboard/index', array(
                'users' => User::getPublicProfilesOfAllUsers())
        );
    }

    public function actionAccountSettings()
    {
        Admin::setAccountSuspensionAndDeletionStatus(
            $_POST['suspension'), $_POST['softDelete'), $_POST['user_id')
        );

        $this->redirectTo("admin");
    }

}
