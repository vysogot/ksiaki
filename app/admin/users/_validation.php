<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_presence($params, 'email');

    if (validate_presence($params, 'nick')) {

        $result = execute('call sp_users_find_by_nick_or_email(
            :p_nick_or_email
        );', array(
            array('p_nick_or_email', $params['nick'], PDO::PARAM_STR)
        ));

        if (!empty($result) && $params['id'] != $result->id) {
            validate_uniqueness($params, 'nick', $result);
        }
    }
}
