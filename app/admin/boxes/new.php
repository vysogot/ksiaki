<?php

include '../init.php';

$data = execute('call sp_boxes_new();', []);

send_json($data);
