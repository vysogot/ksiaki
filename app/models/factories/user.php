<?php

namespace App\Models\Factories;

use App\Models\User as Model;

class User extends \Core\DatabaseFactory
{

  public static function find($params)
  {

    $result = [];

    if (isset($params['id'])) {
      $result = self::execute('call sp_users_find_one_by_id(:p_id);', array(
        array('p_id', $params['id'], 'int')
      ));
    } elseif (isset($params['name_or_email'])) {
      $result = self::execute('call sp_users_find_one_by_name_or_email(:p_name_or_email);', array(
        array('p_name_or_email', $params['name_or_email'], 'str')
      ));
    }

    return (empty($result)) ? null : new Model($result);
  }

  public static function create($new)
  {
    $result = self::execute('call sp_users_create(:p_name, :p_email, :p_password_hash);', array(
      array('p_name', $new->name, 'str'),
      array('p_email', $new->email, 'str'),
      array('p_password_hash', $new->password_hash, 'str')
    ));

    return ($result->rowCount == 0) ? null : self::find(['id' => $result->lastInsertId]);
  }

  public static function update($params)
  {
    $result = self::execute('call sp_users_update(:p_id, :p_name, :p_password_hash);', array(
      array('p_id', $params['id'], 'int'),
      array('p_name', $params['name'], 'str'),
      array('p_password_hash', $params['password_hash'], 'str')
    ));

    return empty($result)? null : new Model($result);
  }

  public static function delete($id, $all = false)
  {
    return $dbc->execute('call sp_users_delete(
      :p_id
    );', array(
      array('p_id', $id, 'int')
    ));
  }
}
