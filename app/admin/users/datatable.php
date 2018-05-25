<?php

include '../init.php';

$params = [
  "offset" => 0,
  "limit" => 5000
];

$params = array_merge($params, $_GET);

$data = execute('call sp_users_all(
  :p_offset,
  :p_limit
);', array(
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true, false);

header('Content-type: application/json');
print json_encode(array('data' => $data));
