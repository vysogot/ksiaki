<?php

include '../init.php';

$data = execute('call sp_heroes_new();', []);

header('Content-type: application/json');
print json_encode(array($data));
