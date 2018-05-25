<?php

include '../init.php';

$result = execute('call sp_backgrounds_delete(:p_id, :p_user_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT),
  array('p_user_id', get_user_id(), PDO::PARAM_INT)
));

push_result2json($result);
