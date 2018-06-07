<?php

include '../init.php';

$result = execute('call sp_static_sites_delete(:p_id, :p_user_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT),
  array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
));

send_json($result);
