<?php

include '../init.php';

$result = execute('call sp_sponsors_new();', []);

send_json($result);
