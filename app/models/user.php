<?php

namespace App\Models;

use App\Models\Factories\User as Factory;

class User
{

  public function __construct($result = null)
  {
    if (empty($result)) {
      $factory = new Factory();
      $result = $factory->getNew();
    }

    $this->setObject($result);
  }

    public static function find($name_or_email)
    {
      $factory = new Factory();
      $result = $factory->get($name_or_email);
      return new self($result);
    }


    public static function create($params)
    {

    }

    public function authenticate($password)
    {
      return password_verify($password, $this->password_hash);
    }

    private function setObject($result)
    {
      $this->id = $result->id;
      $this->name = $result->name;
      $this->email = $result->email;
      $this->password_hash = $result->password_hash;
    }

}
