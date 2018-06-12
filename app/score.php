<?php

include 'init.php';

if ($post) {

  $params = array_merge($params, $_POST);

  // checking for cheating in games
  // JS calculates the same and passes it through obscure field "main_ball_color"
  $checknumber = str_pad(dechex($params['points_total']), 6, "0", STR_PAD_LEFT);

  if (!empty($_SESSION['user_id'])) {

      $data = execute('call sp_score_games_create(
        :p_user_id,
        :p_contest_id,
        :p_level,
        :p_begins_at,
        :p_ends_at,
        :p_points,
        :p_points_total,
        :p_checknumber_client,
        :p_checknumber_server
      );', array(
        array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
        array('p_contest_id', $params['contest_id'], PDO::PARAM_INT),
        array('p_level', $params['level'], PDO::PARAM_INT),
        array('p_begins_at', date('Y-m-d H:i:s', $params['begins_at']), PDO::PARAM_STR),
        array('p_ends_at', date('Y-m-d H:i:s'), PDO::PARAM_STR),
        array('p_points', $params['points'], PDO::PARAM_INT),
        array('p_points_total', $params['points_total'], PDO::PARAM_INT),
        array('p_checknumber_client', $params['main_ball_color'], PDO::PARAM_STR),
        array('p_checknumber_server', $checknumber, PDO::PARAM_STR)
      ));

  }

  send_json($data);

}
