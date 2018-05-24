<?php

include '../init.php';

$data = execute('call sp_backgrounds_new();', []);

header('Content-type: application/json');
print json_encode(array($data));
