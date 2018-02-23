<?php

namespace App\Models\Factories;

use Core\DatabaseFactory;
use App\Models\Contest as Model;

class Contest extends DatabaseFactory
{

  public static function find($id)
  {
    $result = self::execute('call sp_contests_find(
      :p_id
    );', array(
      array('p_id', $id, 'int')
    ));

    return Model::build($result);
  }

  public static function all($params)
  {
    $defaults = [
      "id" => null,
      "name" => null,
      "offset" => 0,
      "limit" => 50
    ];

    $params = array_merge($defaults, $params);

    $result = self::execute('call sp_contests_all(
      :p_id,
      :p_name,
      :p_offset,
      :p_limit
    );', array(
      array('p_id', $params['id'], 'int'),
      array('p_name', $params['name'], 'str'),
      array('p_offset', $params['offset'], 'int'),
      array('p_limit', $params['limit'], 'int')
    ), true);

    return Model::build($result);
  }

  public static function create($params)
  {
    return self::execute('call sp_contests_create(
      :p_game_id,
      :p_contest_type_id,
      :p_name,
      :p_description,
      :p_banner_url,
      :p_begins_at,
      :p_ends_at,
      :p_display_ad
    );', array(
      array('p_game_id', $params['game_id'], 'int'),
      array('p_contest_type_id', $params['contest_type_id'], 'int'),
      array('p_name', $params['name'], 'str'),
      array('p_description', $params['description'], 'str'),
      array('p_banner_url', $params['banner_url'], 'str'),
      array('p_begins_at', $params['begins_at']->format('Y-m-d H:i:s'), 'str'),
      array('p_ends_at', $params['ends_at']->format('Y-m-d H:i:s'), 'str'),
      array('p_display_ad', $params['display_ad'], 'bool')
    ));

    return ($result->rowCount == 0) ? null : self::find(['id' => $result->lastInsertId]);
  }

  public static function update($params)
  {
    return self::execute('call sp_contests_update(
      :p_id,
      :p_game_id,
      :p_contest_type_id,
      :p_name,
      :p_description,
      :p_banner_url,
      :p_begins_at,
      :p_ends_at,
      :p_display_ad
    );', array(
      array('p_id', $params['id'], 'int'),
      array('p_game_id', $params['game_id'], 'int'),
      array('p_contest_type_id', $params['contest_type_id'], 'int'),
      array('p_name', $params['name'], 'str'),
      array('p_description', $params['description'], 'str'),
      array('p_banner_url', $params['banner_url'], 'str'),
      array('p_begins_at', $params['begins_at']->format('Y-m-d H:i:s'), 'str'),
      array('p_ends_at', $params['ends_at']->format('Y-m-d H:i:s'), 'str'),
      array('p_display_ad', $params['display_ad'], 'bool')
    ));

    return Model::build($result);
  }

  public static function delete($id)
  {
    return self::execute('call sp_contests_delete(
      :p_id
    );', array(
      array('p_id', $id, 'int')
    ));
  }
}
