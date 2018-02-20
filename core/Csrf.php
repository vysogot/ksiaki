<?php

namespace Core;

class Csrf
{

  public function makeToken($session)
  {
      // token is valid for 1 day
      $max_time    = 60 * 60 * 24;
      $stored_time = $session['csrf_token_time'];
      $csrf_token  = $session['csrf_token'];

      if ($max_time + $stored_time <= time() || empty($csrf_token)) {
          $session['csrf_token'] = md5(uniqid(rand(), true));
          $session['csrf_token_time'] = time();
      }

      return $session['csrf_token'];
  }

  public function isTokenValid()
  {
      $token = $_POST['csrf_token'];
      return $token === $_SESSION['csrf_token'] && !empty($token);
    }
}
