<?php

namespace Core;

class Session
{

  public function __construct()
  {
    $session_id = session_id();

    if (empty($session_id) && !$this->concurrentExists($session_id)) {
      session_start();
    }
  }

  public function set($key, $value)
  {
      $_SESSION[$key] = $value;
  }

  public function get($key)
  {
    if (isset($_SESSION[$key])) {
      $value = $_SESSION[$key];
      return $this->xssFilter($value);
    }
  }

  public function add($key, $value)
  {
      $_SESSION[$key][] = $value;
  }

  public function destroy()
  {
      session_destroy();
  }

  public function logout()
  {
      $user_id = $this->get('user_id');

      $this->deleteCookie($user_id);
      $this->destroy();
      $this->updateSessionId($user_id);
  }

  public function deleteCookie($user_id = null)
  {
      if (isset($user_id)) {
        $factory = new DatabaseFactory;
        $sql = "UPDATE users SET user_remember_me_token = :user_remember_me_token WHERE user_id = :user_id LIMIT 1";
        $sth = $factory->connection->prepare($sql);
        
        $sth->execute(array(':user_remember_me_token' => NULL, ':user_id' => $user_id));
      }

      setcookie('remember_me', false, time() - (3600 * 24 * 3650), Config::get('COOKIE_PATH'),
          Config::get('COOKIE_DOMAIN'), Config::get('COOKIE_SECURE'), Config::get('COOKIE_HTTP'));
  }

  public function updateSessionId($user_id, $session_id = null)
  {
    $factory = new DatabaseFactory;
    $factory->execute('call sp_updateSessionId(
      :p_user_id,
      :p_session_id
    );', array(
      array('p_user_id', $user_id, 'int'),
      array('p_session_id', $session_id, 'str')
    ));
  }

  public function concurrentExists($session_id)
  {
    $factory = new DatabaseFactory;
    $user_id = $this->get('user_id');

    if (isset($user_id) && isset($session_id)) {

          $result = $factory->execute('call sp_isConcurrentSessionExists(
            :p_user_id
          );', array(
            array('p_user_id', $user_id, 'int')
          ));

          $userSessionId = !empty($result)? $result->session_id: null;

          return $session_id !== $userSessionId;
      }

      return false;
  }

  public function isUserLoggedIn()
  {
      return ($this->get('user_logged_in') ? true : false);
  }

  public function ensureLoggedIn()
  {
    $this->destroy();
    header('location: ' . Config::get('URL') . 'login?redirect=' . urlencode($_SERVER['REQUEST_URI']));
    exit();
  }

  public function isAdmin()
  {
    if (!$this->isUserLoggedIn() || $this->get("user_account_type") != 7) {
      $this->destroy();
      header('location: ' . Config::get('URL') . 'login');
      exit();
    }
  }

  private function XSSFilter(&$value)
  {
    if (is_string($value)) {
      $value = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    } else if (is_array($value) || is_object($value)) {

      /**
       * Make sure the element is passed by reference,
       * In PHP 7, foreach does not use the internal array pointer.
       * In order to be able to directly modify array elements within the loop
       * precede $value with &. In that case the value will be assigned by reference.
       * @see http://php.net/manual/en/control-structures.foreach.php
       */
      foreach ($value as &$valueInValue) {
        $this->XSSFilter($valueInValue);
      }
    }

    return $value;
  }
}
