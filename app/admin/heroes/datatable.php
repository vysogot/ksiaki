<?php

include '../init.php';

$result = execute('call sp_heroes_all();', [], true);

send_json(['data' => $result]);
