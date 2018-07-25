<?php

include '../init.php';

$result = execute('call sp_score_games_toggle_rankable(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT)
));

send_json($result);
