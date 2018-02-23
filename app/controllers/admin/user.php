<?php

namespace App\Controllers\Admin;

use App\Models\Avatar;
use App\Models\Login;
use App\Models\PasswordReset;
use App\Models\User as Model;

use Core\Auth;
use Core\Csrf;
use Core\Redirect;
use Core\Request;
use Core\Session;

class User extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
    $this->session->ensureLoggedIn();
  }

  public function index()
  {
      $this->render('user/index', array(
          'user_name' => $this->session->get('user_name'),
          'user_email' => $this->session->get('user_email'),
          'user_gravatar_image_url' => $this->session->get('user_gravatar_image_url'),
          'user_avatar_file' => $this->session->get('user_avatar_file'),
          'user_account_type' => $this->session->get('user_account_type')
      ));
  }

  public function editUsername()
  {
      $this->render('user/editUsername');
  }

  /**
   * Edit user name (perform the real action after form has been submitted)
   */
  public function editUsername_action()
  {
      // check if csrf token is valid
      if (!Csrf::isTokenValid()) {
          Login::logout();
          Redirect::home();
          exit();
      }

      Model::editUserName($_POST['user_name'));
      $this->redirectTo('user/editUsername');
  }

  /**
   * Show edit-my-user-email page
   */
  public function editUserEmail()
  {
      $this->render('user/editUserEmail');
  }

  /**
   * Edit user email (perform the real action after form has been submitted)
   */
  // make this POST
  public function editUserEmail_action()
  {
      Model::editUserEmail($_POST['user_email'));
      $this->redirectTo('user/editUserEmail');
  }

  /**
   * Edit avatar
   */
  public function editAvatar()
  {
      $this->render('user/editAvatar', array(
          'avatar_file_path' => Avatar::getPublicUserAvatarFilePathByUserId($this->session->get('user_id'))
      ));
  }

  /**
   * Perform the upload of the avatar
   * POST-request
   */
  public function uploadAvatar_action()
  {
      Avatar::createAvatar();
      $this->redirectTo('user/editAvatar');
  }

  /**
   * Delete the current user's avatar
   */
  public function deleteAvatar_action()
  {
      Avatar::deleteAvatar($this->session->get("user_id"));
      $this->redirectTo('user/editAvatar');
  }

  /**
   * Show the change-account-type page
   */
  public function changeUserRole()
  {
      $this->render('user/changeUserRole');
  }

  /**
   * Perform the account-type changing
   * POST-request
   */
  public function changeUserRole_action()
  {
      if ($_POST['user_account_upgrade')) {
          // "2" is quick & dirty account type 2, something like "premium user" maybe. you got the idea :)
          UserRole::changeUserRole(2);
      }

      if ($_POST['user_account_downgrade')) {
          // "1" is quick & dirty account type 1, something like "basic user" maybe.
          UserRole::changeUserRole(1);
      }

      $this->redirectTo('user/changeUserRole');
  }

  /**
   * Password Change Page
   */
  public function changePassword()
  {
      $this->render('user/changePassword');
  }

  /**
   * Password Change Action
   * Submit form, if retured positive redirect to index, otherwise show the changePassword page again
   */
  public function changePassword_action()
  {
      $result = PasswordReset::changePassword(
          $this->session->get('user_name'), $_POST['user_password_current'),
          $_POST['user_password_new'), $_POST['user_password_repeat')
      );

      if($result)
          $this->redirectTo('user/index');
      else
          $this->redirectTo('user/changePassword');
  }
}
