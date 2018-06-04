<?php

include '../init.php';

$data = execute('call sp_backgrounds_new();', []);

send_json($data);
