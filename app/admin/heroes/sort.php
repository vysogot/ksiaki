<?php

include '../init.php';

if ($post) {

    $params = array_merge($params, $_POST);

    $result = execute('call sp_heroes_update_positions(
        :p_heroes_positions
    );', array(
        array('p_heroes_positions', $params['heroes_positions'], PDO::PARAM_STR),
    ));

    send_json(['rowCount' => $result->rowCount, 'token' => get_csrf_token()]);

}
