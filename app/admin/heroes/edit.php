<?php

include '../init.php';

$data = execute('call sp_heroes_find(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT)
));


header('Content-type: application/json');
print json_encode(array($data));
