<?php

include 'init.php';

if ($post) {

  $params = array_merge($params, $_POST);

  $data = execute('call sp_game_scores_create(
    :p_user_id,
    :p_contest_id,
    :p_level,
    :p_begins_at,
    :p_ends_at,
    :p_points,
    :p_points_total
  );', array(
    array('p_user_id', $params['user_id'], PDO::PARAM_INT),
    array('p_contest_id', $params['contest_id'], PDO::PARAM_INT),
    array('p_level', $params['level'], PDO::PARAM_INT),
    array('p_begins_at', date('Y-m-d H:i:s', strtotime($params['begins_at'])), PDO::PARAM_STR),
    array('p_ends_at', date('Y-m-d H:i:s', strtotime($params['ends_at'])), PDO::PARAM_STR),
    array('p_points', $params['points'], PDO::PARAM_INT),
    array('p_points_total', $params['points_total'], PDO::PARAM_INT)
  ));

  header("Content-Type: application/json");
  echo json_encode($data);

}
