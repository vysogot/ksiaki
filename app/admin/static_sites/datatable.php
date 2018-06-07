<?php

include '../init.php';

$result = execute('call sp_static_sites_all();', [], true);

send_json(['data' => $result]);
