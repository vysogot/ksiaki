<?php

include '../init.php';
include '_validation.php';

if ($post) {

  $result = [];

  $params = array_merge($params, $_POST);
  validate($params);

  if (empty($params['errors'])) {

    $password_hash = password_hash($params['password'], PASSWORD_DEFAULT);

    if (!empty($_FILES['avatar_file']['name'])) {
      $params['avatar_url'] = file_upload($_FILES['avatar_file']);
    }

    $result = execute('call sp_users_create(
      :p_role_id,
      :p_nick,
      :p_name,
      :p_email,
      :p_avatar_url,
      :p_is_active,
      :p_password_hash,
      :p_created_by
    );', array(
      array('p_role_id', $params['role_id'], PDO::PARAM_INT),
      array('p_nick', $params['name'], PDO::PARAM_STR),
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_email', $params['email'], PDO::PARAM_STR),
      array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
      array('p_is_active', $params['is_active'], PDO::PARAM_INT),
      array('p_password_hash', $password_hash, PDO::PARAM_STR),
      array('p_created_by', $_SESSION['user_id'], PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      flash('notice', t('create_success'));
      redirect('show.php?id=' . $result->lastInsertId);
    } else {
      flash('warning', t('create_failure'));
    }

  } else {

      $result = ['rowCount' => -1, 'lastInsertId' => 0,
          'errors' => $params['errors']
      ];

  }

  send_json($result);

}
