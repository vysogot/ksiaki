<?php

include '../init.php';
include '_validation.php';

$result = ['rowCount' => -1, 'lastInsertId' => 0];


if ($post) {

  $params = array_merge($params, $_POST);

  validate($params, $errors);

  if (empty($errors)) {

    if (!empty($_FILES['avatar_file']['name'])) {
      $params['avatar_url'] = file_upload($_FILES['avatar_file']);
    }

    if (!empty($_FILES['header_file']['name'])) {
      $params['header_url'] = file_upload($_FILES['header_file']);
    }

    $result = execute('call sp_backgrounds_update(
      :p_id,
      :p_name,
      :p_image_url,
      :p_link_url,
      :p_background_color,
      :p_details_color,
      :p_is_active,
      :p_begins_at,
      :p_ends_at,
      :p_user_id
    );', array(
      array('p_id', $params['id'], PDO::PARAM_INT),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_image_url', $params['image_url'], PDO::PARAM_STR),
      array('p_link_url', $params['link_url'], PDO::PARAM_STR),
      array('p_background_color', $params['background_color'], PDO::PARAM_STR),
      array('p_details_color', $params['details_color'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
      array('p_begins_at', $params['begins_at'], PDO::PARAM_STR),
      array('p_ends_at', $params['ends_at'], PDO::PARAM_STR),
      //array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
      //array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR),
      array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
    ), false, false);

  }

}

send_json($result);
