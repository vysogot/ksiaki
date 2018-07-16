<?php

include 'init.php';

if ($post) {

  if (!empty($_SESSION['user_id'])) {

      $params = array_merge($params, $_POST);

      $tick_time = $params['tick_time'] ?? '';
      
      $checknumber_client = $tick_time . $params['main_ball_color'];
      $checknumber_server = cheat_check($params);

      execute('call sp_score_games_add_activities(
          :p_user_id,
          :p_contest_id,
          :p_points_total
      );', array(
          array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
          array('p_contest_id', $params['contest_id'], PDO::PARAM_INT),
          array('p_points_total', $params['points_total'], PDO::PARAM_INT)
      ));

      $result = execute('call sp_score_games_create(
        :p_user_id,
        :p_contest_id,
        :p_level,
        :p_begins_at,
        :p_ends_at,
        :p_win,
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
        array('p_win', $params['win'], PDO::PARAM_INT),
        array('p_points', $params['points'], PDO::PARAM_INT),
        array('p_points_total', $params['points_total'], PDO::PARAM_INT),
        array('p_checknumber_client', $checknumber_client, PDO::PARAM_STR),
        array('p_checknumber_server', $checknumber_server, PDO::PARAM_STR)
      ));

  }

  if (isset($result) && $result->rowCount == 1) {
      send_json(['success' => true]);
  } else {
      send_json(['success' => false]);
  }


}

function cheat_check($params) {
      
      $game = fetch_one('call sp_games_find_by_contest_id(
        :p_contest_id
      );', array(
        array('p_contest_id', $params['contest_id'], PDO::PARAM_INT)
      ));

      $game_settings = '';

      switch ($game->name) {

        case 'sorcerer':

          switch ($params['level']) {
            case '1':
              $game_settings = '1000:1000/50:60:4;';
              break;
            case '2':
              $game_settings = '1000:1000/40:80:5;';
              break;
            case '3':
              $game_settings = '1000:1000/30:100:5;';
              break;
          }

          break;

        case 'memory':
          $game_settings = '2:10/4,8,16,32:30,60,120,240;';
          break;

        case 'gems':
          $game_settings = '10:5;';
          break;

      }

      $points_total_check = str_pad(dechex($params['points_total']), 6, "0", STR_PAD_LEFT);
      $checknumber_server = $game_settings . $points_total_check;

      return $checknumber_server;

}
