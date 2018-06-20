<?php

include '../init.php';
include '_validation.php';

if ($post) {

    $params = array_merge($params, $_POST);
    validate($params);

    $result = [];

    if (empty($params['errors'])) {

        $result = execute('call sp_mail_templates_update(
          :p_id,
          :p_subject,
          :p_content
        );', array(
          array('p_id', $params['id'], PDO::PARAM_INT),
          array('p_subject', $params['subject'], PDO::PARAM_STR),
          array('p_content', $params['content'], PDO::PARAM_LOB)
        ), false, false);

    } else {

        $result = ['rowCount' => -1, 'lastInsertId' => 0,
            'errors' => $params['errors'],
            'token' => get_csrf_token()
        ];

    }

    send_json($result);
}
