<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

      $contest = execute('call sp_contests_find(:p_id);', array(
          array('p_id', $params['contest_id'], PDO::PARAM_INT)
      ));

      $filename = $contest->slug;

      if (!empty($_FILES['actual_file']['name'])) {
          $params['image_url'] = file_upload($_FILES['actual_file'], ['subdir' => 'contests', 'thumbnail' => true, 'filename' => $filename]);
      }

      $result = execute('call sp_contest_prizes_update(
          :p_id,
          :p_contest_id,
          :p_sponsor_id,
          :p_name,
          :p_description,
          :p_image_url,
          :p_is_active,
          :p_user_id
      );', array(
          array('p_id', $params['id'], PDO::PARAM_STR),
          array('p_contest_id', $params['contest_id'], PDO::PARAM_STR),
          array('p_sponsor_id', $params['sponsor_id'], PDO::PARAM_INT),
          array('p_name', $params['name'], PDO::PARAM_STR),
          array('p_description', $params['description'], PDO::PARAM_STR),
          array('p_image_url', $params['image_url'], PDO::PARAM_INT),
          array('p_is_active',$params['is_active'], PDO::PARAM_STR),
          array('p_user_id', $_SESSION['user_id'], PDO::PARAM_STR)
    ), false, false);

  } else {

      $result = ['rowCount' => -1, 'lastInsertId' => 0,
          'errors' => $params['errors'],
          'token' => get_csrf_token()
      ];

  }

  send_json($result);

}
