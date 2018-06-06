<?php

include '../init.php';

$params = [
  "start" => 0,
  "length" => 10,
  "search" => '',
  "order" => '',
  "columns" => '',
  "draw" => ''
];

$params = array_merge($params, $_GET);

$columnIdx = $params['order'][0]['column'];
$columnOrd = $params['order'][0]['dir'];
$requestColumn = $params['columns'][$columnIdx]['data'];

$count = execute('call sp_users_all_count(:p_search);', array(
  array('p_search', $params['search']['value'], PDO::PARAM_STR)
), false, false);

$data = execute('call sp_users_all(
  :p_offset,
  :p_limit,
  :p_search,
  :p_ordercolumn,
  :p_orderdir
);', array(
  array('p_offset', $params['start'], PDO::PARAM_INT),
  array('p_limit', $params['length'], PDO::PARAM_INT),
  array('p_search', $params['search']['value'], PDO::PARAM_STR),
  array('p_ordercolumn', $requestColumn, PDO::PARAM_STR),
  array('p_orderdir', $columnOrd, PDO::PARAM_STR)
), true, false);

send_json([
  'draw' => $params['draw'],
  'recordsTotal' => $count->recordsTotal,
  'recordsFiltered' => $count->recordsFiltered,
  'data' => $data
]);
