<?php

include '../init.php';
include '_validation.php';

authorize(is_admin());

if ($post) {

    $params = [
        'gender' => null
    ];

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        if (!empty($_FILES['avatar_file']['name'])) {
            $params['avatar_url'] = file_upload($_FILES['avatar_file'], ['subdir' => 'users/avatars', 'filename' => 'konkursiak-' . $params['nick']]);
        }

        $password_hash = '';
        if (!empty($params['password'])) {
            $password_hash = password_hash($params['password'], PASSWORD_DEFAULT);
        }

        $result = execute('call sp_users_update(
            :p_id,
            :p_role_id,
            :p_is_active,
            :p_birthday,
            :p_caretaker_name,
            :p_caretaker_surname,
            :p_caretaker_email,
            :p_caretaker_is_active,
            :p_nick,
            :p_email,
            :p_avatar_url,
            :p_gender,
            :p_name,
            :p_surname,
            :p_address,
            :p_postcode,
            :p_city,
            :p_contest_agreement,
            :p_marketing_agreement,
            :p_notifications_agreement,
            :p_statute_agreement,
            :p_password_hash,
            :p_caretaker_activation_hash,
            :p_updated_by
        );', array(
            array('p_id', $params['id'], PDO::PARAM_INT),
            array('p_role_id', $params['role_id'], PDO::PARAM_INT),
            array('p_is_active', $params['is_active'], PDO::PARAM_INT),
            array('p_birthday', date('Y-m-d', strtotime($params['birthday'])), PDO::PARAM_STR),
            array('p_caretaker_name', $params['caretaker_name'], PDO::PARAM_STR),
            array('p_caretaker_surname', $params['caretaker_surname'], PDO::PARAM_STR),
            array('p_caretaker_email', $params['caretaker_email'], PDO::PARAM_STR),
            array('p_caretaker_is_active', $params['caretaker_is_active'], PDO::PARAM_INT),
            array('p_nick', $params['nick'], PDO::PARAM_STR),
            array('p_email', $params['email'], PDO::PARAM_STR),
            array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
            array('p_gender', $params['gender'], PDO::PARAM_INT),
            array('p_name', $params['name'], PDO::PARAM_STR),
            array('p_surname', $params['surname'], PDO::PARAM_STR),
            array('p_address', $params['address'], PDO::PARAM_STR),
            array('p_postcode', $params['postcode'], PDO::PARAM_STR),
            array('p_city', $params['city'], PDO::PARAM_STR),
            array('p_contest_agreement', $params['contest_agreement'], PDO::PARAM_INT),
            array('p_marketing_agreement', $params['marketing_agreement'], PDO::PARAM_INT),
            array('p_notifications_agreement', $params['notifications_agreement'], PDO::PARAM_INT),
            array('p_statute_agreement', $params['statute_agreement'], PDO::PARAM_INT),
            array('p_password_hash', $password_hash, PDO::PARAM_STR),
            array('p_caretaker_activation_hash', '', PDO::PARAM_STR),
            array('p_updated_by', current_session('user_id'), PDO::PARAM_INT)
        ));

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);

}
