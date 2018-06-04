<?php

include '../init.php';

$data = execute('call sp_heroes_new();', []);

send_json($data);
