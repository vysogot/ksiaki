<?php

include '../init.php';

$result = execute('call sp_heroes_new();', []);

send_json($result);
