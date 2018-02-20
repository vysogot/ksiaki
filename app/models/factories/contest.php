<?php

namespace App\Models\Factories;

use Core\DatabaseFactory;

class Contest extends DatabaseFactory
{

  public function __construct()
  {
    parent::__construct();
  }

  public function get($options = null)
  {
    if empty($options) {

      return $dbc->execute('call sp_contests_get(
        :p_id
      );', array(
        array('p_id', 0, 'int')
      ));

    } elseif (array_key_exists('id', $options)) {

      return $dbc->execute('call sp_contests_get(
        :p_id
      );', array(
        array('p_id', $id, 'int')
      ));

    } elseif (array_key_exists('offset', $options) && array_key_exists('limit', $options)) {

      return $dbc->execute('call sp_contests_all(
        :p_offset,
        :p_limit
      );', array(
        array('p_offset', $offset, 'int'),
        array('p_limit', $limit, 'int')
      ),
      true);

    }
  }

  public function set($params)
  {
    return $dbc->execute('call sp_contests_set(
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
  }

  public function delete($id)
  {
    return $dbc->execute('call sp_contests_delete(
      :p_id
    );', array(
      array('p_id', $id, 'int')
    ));
  }
}
