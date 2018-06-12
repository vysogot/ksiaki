<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $params = array_merge($params, $_POST);
  validate($params);

  $result = [];

  if (empty($params['errors'])) {

      if (!empty($_FILES['actual_file']['name'])) {
          $params['file_url'] = file_upload($_FILES['actual_file']);
      }

      $result = execute('call sp_hero_files_update(
          :p_id,
          :p_hero_id,
          :p_hero_file_type_id,
          :p_name,
          :p_description,
          :p_file_url,
          :p_is_active,
          :p_user_id
      );', array(
          array('p_id', $params['id'], PDO::PARAM_STR),
          array('p_hero_id', $params['hero_id'], PDO::PARAM_STR),
          array('p_hero_file_type_id', $params['hero_file_type_id'], PDO::PARAM_STR),
          array('p_name', $params['name'], PDO::PARAM_STR),
          array('p_description', $params['description'], PDO::PARAM_STR),
          array('p_file_url', $params['file_url'], PDO::PARAM_INT),
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
