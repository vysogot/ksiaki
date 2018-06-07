<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        $result = execute('call sp_static_sites_update(
          :p_id,
          :p_title,
          :p_slug,
          :p_content,
          :p_is_active
        );', array(
          array('p_id', $params['id'], PDO::PARAM_INT),
          array('p_title', $params['title'], PDO::PARAM_STR),
          array('p_slug', $params['slug'], PDO::PARAM_STR),
          array('p_content', $params['content'], PDO::PARAM_STR),
          array('p_is_active', $params['is_active'], PDO::PARAM_INT)
        ), false, false);

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors']
        ];

    }

    send_json($result);
}
