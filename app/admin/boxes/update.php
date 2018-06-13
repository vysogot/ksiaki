<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

    if (!empty($_FILES['image_file']['name'])) {
      $params['image_url'] = file_upload($_FILES['image_file'], ['subdir' => 'boxes']);
    }

    $result = execute('call sp_boxes_update(
      :p_id,
      :p_name,
      :p_image_url,
      :p_link_url,
      :p_is_active,
      :p_begins_at,
      :p_ends_at
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_image_url', $params['image_url'], PDO::PARAM_STR),
      array('p_link_url', $params['link_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
      array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR)
    ), false, false);

  } else {

      $result = ['rowCount' => -1, 'lastInsertId' => 0,
          'errors' => $params['errors'],
          'token' => get_csrf_token()
      ];

  }

  send_json($result);

}
