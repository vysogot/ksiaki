<?php

include '../init.php';

$result = execute('call sp_backgrounds_all();', [], true);

send_json(['data' => $result]);
