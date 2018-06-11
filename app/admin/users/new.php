<?php

include '../init.php';

$result = execute('call sp_users_new();', []);

send_json($result);
