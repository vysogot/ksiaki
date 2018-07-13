<?php

function validate(&$params, $options) {

    $register = $options['for'] == 'register';

    if ($register) {

        if (validate_presence($params, 'nick')) {

            validate_slug($params, 'nick');
            validate_not_shorter_than($params, 'nick', 3);
            validate_not_longer_than($params, 'nick', 20);

            $result = execute('call sp_users_find_by_nick_or_email(
                :p_nick_or_email
            );', array(
                array('p_nick_or_email', $params['nick'], PDO::PARAM_STR)
            ));

            validate_uniqueness($params, 'nick', $result);
        }

        if (validate_email($params, 'email')) {

            $result = execute('call sp_users_find_by_nick_or_email(
                :p_nick_or_email
            );', array(
                array('p_nick_or_email', $params['email'], PDO::PARAM_STR)
            ));

            validate_uniqueness($params, 'email', $result);
        }

    }

    validate_not_shorter_than($params, 'name', 3);
    validate_not_longer_than($params, 'name', 20);

    validate_not_shorter_than($params, 'surname', 3);
    validate_not_longer_than($params, 'surname', 20);

    validate_not_shorter_than($params, 'address', 6);
    validate_not_longer_than($params, 'address', 30);

    validate_not_shorter_than($params, 'city', 3);
    validate_not_longer_than($params, 'city', 20);

    validate_not_shorter_than($params, 'postcode', 6);
    validate_not_longer_than($params, 'postcode', 6);

    validate_not_null($params, 'gender');

    if ($register || (!$register && !empty($params['password']))) {

        validate_not_shorter_than($params, 'password', 6);

    }

    if (!is_adult(strtotime($params['birthday']))) {

        validate_not_shorter_than($params, 'caretaker_name', 3);
        validate_not_longer_than($params, 'caretaker_name', 20);

        validate_not_shorter_than($params, 'caretaker_surname', 3);
        validate_not_longer_than($params, 'caretaker_surname', 20);

        validate_email($params, 'caretaker_email');
        validate_distinctness($params, ['email', 'caretaker_email']);

    }

}
