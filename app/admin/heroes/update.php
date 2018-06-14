<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        $slug = $params['slug'];

        if (!empty($_FILES['avatar_file']['name'])) {
            $params['avatar_url'] = file_upload($_FILES['avatar_file'], ['subdir' => 'heroes', 'filename' => "$slug-avatar"]);
        }

        if (!empty($_FILES['header_file']['name'])) {
            $params['header_url'] = file_upload($_FILES['header_file'], ['subdir' => 'heroes', 'filename' => "$slug-header"]);
        }

        if (!empty($_FILES['gadget_file']['name'])) {
            $params['gadget_url'] = file_upload($_FILES['gadget_file'], ['subdir' => 'heroes', 'filename' => "$slug-gadget"]);
        }

        if (!empty($_FILES['footer_file']['name'])) {
            $params['footer_url'] = file_upload($_FILES['footer_file'], ['subdir' => 'heroes', 'filename' => "$slug-footer"]);
        }

        if (!empty($_FILES['cover_file']['name'])) {
            $params['cover_url'] = file_upload($_FILES['cover_file'], ['subdir' => 'heroes', 'filename' => "$slug-cover"]);
        }

        if (!empty($_FILES['video_file']['name'])) {
            $params['video_url'] = file_upload($_FILES['video_file'], ['subdir' => 'heroes', 'filename' => "$slug-video"]);
        }

        if (!empty($_FILES['video_cover_file']['name'])) {
            $params['video_cover_url'] = file_upload($_FILES['video_cover_file'], ['subdir' => 'heroes', 'filename' => "$slug-video-cover"]);
        }

        $result = execute('call sp_heroes_update(
            :p_id,
            :p_name,
            :p_slug,
            :p_description,
            :p_avatar_url,
            :p_header_url,
            :p_cover_url,
            :p_video_url,
            :p_video_cover_url,
            :p_gadget_url,
            :p_footer_url,
            :p_license_description,
            :p_is_active,
            :p_user_id
        );', array(
            array('p_id', $params['id'], PDO::PARAM_INT),
            array('p_name', $params['name'], PDO::PARAM_STR),
            array('p_slug', $params['slug'], PDO::PARAM_STR),
            array('p_description', $params['description'], PDO::PARAM_STR),
            array('p_avatar_url', $params['avatar_url'], PDO::PARAM_STR),
            array('p_header_url', $params['header_url'], PDO::PARAM_STR),
            array('p_cover_url', $params['cover_url'], PDO::PARAM_STR),
            array('p_video_url', $params['video_url'], PDO::PARAM_STR),
            array('p_video_cover_url', $params['video_cover_url'], PDO::PARAM_STR),
            array('p_gadget_url', $params['gadget_url'], PDO::PARAM_STR),
            array('p_footer_url', $params['footer_url'], PDO::PARAM_STR),
            array('p_license_description', $params['license_description'], PDO::PARAM_STR),
            array('p_is_active', $params['is_active'], PDO::PARAM_INT),
            array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
        ), false, false);

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);

}
