<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        if (!empty($_FILES['avatar_file']['name'])) {
            $params['avatar_url'] = file_upload($_FILES['avatar_file']);
        }

        if (!empty($_FILES['header_file']['name'])) {
            $params['header_url'] = file_upload($_FILES['header_file']);
        }

        $result = execute('call sp_static_sites_create(
            :p_title,
            :p_slug,
            :p_content,
            :p_is_active
        );', array(
            array('p_title', $params['title'], PDO::PARAM_STR),
            array('p_slug', $params['slug'], PDO::PARAM_STR),
            array('p_content', $params['content'], PDO::PARAM_LOB),
            array('p_is_active', $params['is_active'], PDO::PARAM_INT)
        ));

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);
}
