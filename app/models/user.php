<?php

namespace App\Models;

use App\Models\Factories\User as Factory;

class User extends \Core\Model
{

  public function __construct($result = null)
  {
      foreach ($result as $key => $value) {
          $this->{$key} = $value;
      }

      parent::__construct($this);
  }

    public static function find($name_or_email)
    {
      $factory = new Factory();
      return $factory->get($name_or_email);
    }


    public static function create($params)
    {
      $params['password_hash'] = password_hash($params['password']);
      return $factory->set($params);
    }

    public function authenticate($password)
    {
      return password_verify($password, $this->password_hash);
    }

    public function isAdmin()
    {
      $this->user_account_type != 7;
    }

}
