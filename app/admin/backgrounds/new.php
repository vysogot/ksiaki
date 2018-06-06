<?php

include '../init.php';

$result = execute('call sp_backgrounds_new();', []);

send_json($result);
