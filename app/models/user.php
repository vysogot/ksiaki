<?php

namespace App\Models;

use App\Models\Factories\User as Factory;

class User extends \Core\Model
{

  public function __construct($params)
  {
      foreach ($params as $key => $value) {
          $this->{$key} = $value;
      }

      parent::__construct($this);
  }

    public static function find($params)
    {
      return Factory::find($params);
    }

    public function save()
    {
      $this->password_hash = password_hash($this->password, PASSWORD_DEFAULT);
      return Factory::create($this);
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
