<?php

include '../init.php';

$result = execute('call sp_backgrounds_find(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT)
));

push_result2json($result);
