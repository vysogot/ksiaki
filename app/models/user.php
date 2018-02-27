<?php

namespace App\Models;

use App\Models\Factories\User as Factory;

class User extends \Core\Model
{

  public function __construct($params = [])
  {
    parent::__construct($params);
  }

  protected static function new()
  {
    return Factory::new();
  }

    public static function find($params)
    {
      return Factory::find($params);
    }

    public function save()
    {
      if ($this->validate()) {
        $this->password_hash = password_hash($this->password, PASSWORD_DEFAULT);
        return Factory::create($this);
      }
    }

    public function authenticate($password)
    {
      return password_verify($password, $this->password_hash);
    }

    public function isAdmin()
    {
      $this->user_account_type != 7;
    }

    private function validate()
    {
      if (empty($this->name)) {
        $this->errors["name"] = "validate_presence";
      } else {
        if (self::find(["name_or_email" => $this->name])) {
          $this->errors["name"] = "validate_uniqueness";
        }
      }

      if (filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
        if (self::find(["name_or_email" => $this->email])) {
          $this->errors["email"] = "validate_uniqueness";
        }
      } else {
        $this->errors["email"] = "validate_email_syntax";
      }

      if (strlen($this->password) < 6) {
        $this->errors["password"] = "validate_password_length";
      }

      return empty($this->errors);
    }

}
