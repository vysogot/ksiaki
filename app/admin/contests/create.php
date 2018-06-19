<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

      $slug = $params['slug'];

      if (!empty($_FILES['box_file']['name'])) {
        $params['box_url'] = file_upload($_FILES['box_file'], ['subdir' => 'contests', 'filename' => "$slug-box"]);
      }

      if (!empty($_FILES['header_file']['name'])) {
        $params['header_url'] = file_upload($_FILES['header_file'], ['subdir' => 'contests', 'filename' => "$slug-header"]);
      }

      $result = execute('call sp_contests_create(
        :p_game_id,
        :p_contest_type_id,
        :p_name,
        :p_slug,
        :p_description,
        :p_box_url,
        :p_header_url,
        :p_begins_at,
        :p_ends_at,
        :p_display_ad,
        :p_is_active
      );', array(
        array('p_game_id', $params['game_id'], PDO::PARAM_INT),
        array('p_contest_type_id', $params['contest_type_id'], PDO::PARAM_INT),
        array('p_name', $params['name'], PDO::PARAM_STR),
        array('p_slug', $params['slug'], PDO::PARAM_STR),
        array('p_description', $params['description'], PDO::PARAM_STR),
        array('p_box_url', $params['box_url'], PDO::PARAM_STR),
        array('p_header_url', $params['header_url'], PDO::PARAM_STR),
        array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
        array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR),
        array('p_display_ad', $params['display_ad'], PDO::PARAM_BOOL),
        array('p_is_active', $params['is_active'], PDO::PARAM_BOOL)
      ));

  } else {

      $result = ['rowCount' => -1, 'lastInsertId' => 0,
          'errors' => $params['errors'],
          'token' => get_csrf_token()
      ];

  }

  send_json($result);

}
