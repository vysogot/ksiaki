<?php

namespace App\Models\Factories;

use Core\DatabaseFactory;

class User extends DatabaseFactory
{

  public function __construct()
  {
    parent::__construct();
  }

  public function get($name_or_email)
  {
    return $this->execute('call sp_users_get(:p_name_or_email);', array(
      array('p_name_or_email', $name_or_email, 'str')
    ));
  }

  public function set($params)
  {

  }

  public function delete($id)
  {
    return $dbc->execute('call sp_users_delete(
      :p_id
    );', array(
      array('p_id', $id, 'int')
    ));
  }
}
