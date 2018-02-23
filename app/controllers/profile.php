<?php

namespace App\Controllers;

use App\Models\User;

class Profile extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

    /**
     * This method controls what happens when you move to /overview/index in your app.
     * Shows a list of all users.
     */
    public function index()
    {
        $this->render('profile/index', array(
            'users' => User::getPublicProfilesOfAllUsers())
        );
    }

    /**
     * This method controls what happens when you move to /overview/showProfile in your app.
     * Shows the (public) details of the selected user.
     * @param $user_id int id the the user
     */
    public function showProfile($user_id)
    {
        if (isset($user_id)) {
            $this->render('profile/showProfile', array(
                'user' => User::getPublicProfileOfUser($user_id))
            );
        } else {
            Redirect::home();
        }
    }
}
