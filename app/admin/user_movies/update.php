<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

      if (!empty($_FILES['image_file']['name'])) {
          $params['image_url'] = file_upload($_FILES['image_file'], ['subdir' => 'user_movies']);
      }

      if (!empty($_FILES['video_file']['name'])) {
          $params['video_url'] = file_upload($_FILES['video_file'], ['subdir' => 'user_movies']);
      }

      $result = execute('call sp_user_movies_update(
          :p_id,
          :p_user_id,
          :p_name,
          :p_description,
          :p_video_url,
          :p_image_url,
          :p_link_url,
          :p_is_active,
          :p_begins_at,
          :p_ends_at
      );', array(
          array('p_id', $params['id'], PDO::PARAM_INT),
          array('p_user_id', $params['user_id'], PDO::PARAM_INT),
          array('p_name', $params['name'], PDO::PARAM_STR),
          array('p_description', $params['description'], PDO::PARAM_STR),
          array('p_video_url', $params['video_url'], PDO::PARAM_STR),
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
