<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        if (!empty($_FILES['image_file']['name'])) {
          $params['image_url'] = file_upload($_FILES['image_file'], ['subdir' => 'backgrounds', 'thumbnail' => true]);
        }

        $result = execute('call sp_backgrounds_update(
            :p_id,
            :p_name,
            :p_image_url,
            :p_link_url,
            :p_placement,
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
            array('p_placement', $params['placement'], PDO::PARAM_STR),
            array('p_background_color', $params['background_color'], PDO::PARAM_STR),
            array('p_details_color', $params['details_color'], PDO::PARAM_STR),
            array('p_is_active', $params['is_active'], PDO::PARAM_INT),
            array('p_begins_at', $params['begins_at'], PDO::PARAM_STR),
            array('p_ends_at', $params['ends_at'], PDO::PARAM_STR),
            array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
        ));

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);

}
