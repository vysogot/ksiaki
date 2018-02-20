<?php

namespace App\Models\Factories;

use App\Models\User as Model;

class User extends \Core\DatabaseFactory
{

  public function __construct()
  {
    parent::__construct();
  }

  public function get($name_or_email)
  {
    $result = $this->execute('call sp_users_get(:p_name_or_email);', array(
      array('p_name_or_email', $name_or_email, 'str')
    ));

    return empty($result)? null : new Model($result);
  }

  public function set($params)
  {
    $result = $this->execute('call sp_users_set(:p_name, :p_password_hash);', array(
      array('p_name', $params['name'], 'str'),
      array('p_password_hash', $params['password_hash'], 'str')
    ));

    return empty($result)? null : new Model($result);
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
