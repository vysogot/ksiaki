<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        if (!empty($_FILES['avatar_file']['name'])) {
            $params['avatar_url'] = file_upload($_FILES['avatar_file'], ['subdir' => 'users', 'filename' => 'konkursiak-' . $params['nick']]);
        }

        $result = execute('call sp_users_update(
            :p_id,
            :p_role_id,
            :p_nick,
            :p_name,
            :p_email,
            :p_avatar_url,
            :p_is_active,
            :p_updated_by
        );', array(
            array('p_id', $params['id'], PDO::PARAM_INT),
            array('p_role_id', $params['role_id'], PDO::PARAM_INT),
            array('p_nick', $params['nick'], PDO::PARAM_STR),
            array('p_name', $params['name'], PDO::PARAM_STR),
            array('p_email', $params['email'], PDO::PARAM_STR),
            array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
            array('p_is_active', $params['is_active'], PDO::PARAM_INT),
            array('p_updated_by', $_SESSION['user_id'], PDO::PARAM_INT)
        ), false, false);

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);

}
