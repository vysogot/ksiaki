<?php

include '../init.php';

$data = execute('call sp_users_new();', []);

send_json($data);
