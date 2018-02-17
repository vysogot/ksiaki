<?php

namespace App\Controllers;

class Register extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function index()
  {
      if (Login::isUserLoggedIn()) {
          Redirect::home();
      } else {
          $this->view->render('register/index');
      }
  }

  public function register_action()
  {
      $registration_successful = Registration::registerNewUser();

      if ($registration_successful) {
          $this->redirectTo('login/index');
      } else {
          $this->redirectTo('register/index');
      }
  }

  public function verify($user_id, $user_activation_verification_code)
  {
      if (isset($user_id) && isset($user_activation_verification_code)) {
          Registration::verifyNewUser($user_id, $user_activation_verification_code);
          $this->view->render('register/verify');
      } else {
          $this->redirectTo('login/index');
      }
  }

  public function showCaptcha()
  {
      Captcha::generateAndShowCaptcha();
  }
}
