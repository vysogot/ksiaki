<?php

include '../init.php';

$result = execute('call sp_contests_new();', []);

send_json($result);
