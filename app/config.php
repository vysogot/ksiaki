<?php

namespace App;

class Config
{

  const rootNamespace = "App\\Controllers\\";
  const rootNamespaceDefaults = [
    'controller' => 'home',
    'action' => 'index',
    'notfound_controller' => 'Error',
    'notfound_action' => 'error404'
  ];

  const additionalNamespaces = [
    'Admin\\' => [
      'controller' => 'dashboard',
      'action' => 'index'
    ]
  ];

  const development = array(

      'DB_TYPE' => 'mysql',
      'DB_HOST' => '127.0.0.1',
      'DB_NAME' => 'ksiaki',
      'DB_USER' => 'root',
      'DB_PASS' => '',
      'DB_PORT' => '3306',
      'DB_CHARSET' => 'utf8',

      'SHOW_ERRORS' => true,

      'CAPTCHA_WIDTH' => 359,
      'CAPTCHA_HEIGHT' => 100,

      'EMAIL_USED_MAILER' => 'phpmailer',
      'EMAIL_USE_SMTP' => false,
      'EMAIL_SMTP_HOST' => 'yourhost',
      'EMAIL_SMTP_AUTH' => true,
      'EMAIL_SMTP_USERNAME' => 'yourusername',
      'EMAIL_SMTP_PASSWORD' => 'yourpassword',
      'EMAIL_SMTP_PORT' => 465,
      'EMAIL_SMTP_ENCRYPTION' => 'ssl',

      'EMAIL_PASSWORD_RESET_URL' => 'login/verifypasswordreset',
      'EMAIL_PASSWORD_RESET_FROM_EMAIL' => 'no-reply@example.com',
      'EMAIL_PASSWORD_RESET_FROM_NAME' => 'My Project',
      'EMAIL_PASSWORD_RESET_SUBJECT' => 'Password reset for PROJECT XY',
      'EMAIL_PASSWORD_RESET_CONTENT' => 'Please click on this link to reset your password: ',
      'EMAIL_VERIFICATION_URL' => 'register/verify',
      'EMAIL_VERIFICATION_FROM_EMAIL' => 'no-reply@example.com',
      'EMAIL_VERIFICATION_FROM_NAME' => 'My Project',
      'EMAIL_VERIFICATION_SUBJECT' => 'Account activation for PROJECT XY',
      'EMAIL_VERIFICATION_CONTENT' => 'Please click on this link to activate your account: '
    );

    private static $config;

    public static function get($key) {

      if (array_key_exists($key, self::$config)) {
        return self::$config[$key];
      }

    }

    public static function url()
    {
      return 'http://' . $_SERVER['HTTP_HOST'] . str_replace('public', '', dirname($_SERVER['SCRIPT_NAME']));
    }

    public static function setEnvironment($env)
    {
      $env = $env ?: "development";

      if ($env == 'development') {
        session_start();
        error_reporting(E_ALL);
        ini_set("display_errors", 1);
        ini_set('session.cookie_httponly', 1);
        set_error_handler('Core\Error::errorHandler');
        set_exception_handler('Core\Error::exceptionHandler');
        self::$config = self::development;
      }
    }

}
