<?php

namespace Core;

class Csrf
{

  public function makeToken()
  {
      // token is valid for 1 day
      $max_time    = 60 * 60 * 24;
      $stored_time = $_SESSION['csrf_token_time'];
      $csrf_token  = $_SESSION['csrf_token'];

      if ($max_time + $stored_time <= time() || empty($csrf_token)) {
          $_SESSION['csrf_token'] = md5(uniqid(rand(), true));
          $_SESSION['csrf_token_time'] = time();
      }

      return $_SESSION['csrf_token'];
  }

  public function isTokenValid()
  {
      $token = $_POST['csrf_token'];
      return $token === $_SESSION['csrf_token'] && !empty($token);
    }
}
