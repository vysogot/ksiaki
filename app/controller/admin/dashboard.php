<?php

namespace App\Controller\Admin;

use Core\Request;
use Core\Redirect;

use App\Model\Admin;
use App\Model\User;

class Dashboard extends Front
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->View->render('admin/dashboard/index', array(
                'users' => User::getPublicProfilesOfAllUsers())
        );
    }

    public function actionAccountSettings()
    {
        Admin::setAccountSuspensionAndDeletionStatus(
            Request::post('suspension'), Request::post('softDelete'), Request::post('user_id')
        );

        Redirect::to("admin");
    }

}
