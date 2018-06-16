<?php

include '../init.php';

$result = execute('call sp_contest_prizes_new();', []);

send_json($result);
