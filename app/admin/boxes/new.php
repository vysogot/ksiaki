<?php

include '../init.php';

$result = execute('call sp_boxes_new();', []);

send_json($result);
