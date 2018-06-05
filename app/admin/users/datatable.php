<?php

include '../init.php';

$params = [
  "start" => 0,
  "length" => 10,
  "search" => ''
];

$params = array_merge($params, $_GET);

$data = execute('call sp_users_all(
  :p_offset,
  :p_limit,
  :p_search
);', array(
  array('p_offset', $params['start'], PDO::PARAM_INT),
  array('p_limit', $params['length'], PDO::PARAM_INT),
  array('p_search', $params['search']['value'], PDO::PARAM_STR)
), true, false);

header('Content-type: application/json');
print json_encode(array('data' => $data));
