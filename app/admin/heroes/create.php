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

    $result = execute('call sp_heroes_create(
      :p_name,
      :p_slug,
  		:p_description,
  		:p_avatar_url,
      :p_header_url,
  		:p_is_active
    );', array(
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_slug', $params['slug'], PDO::PARAM_STR),
      array('p_description', $params['description'], PDO::PARAM_STR),
      array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
      array('p_header_url', $params['header_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT)
    ));

  }

}

header('Content-type: application/json');
print json_encode(array($result));
