<?php

include '../init.php';

$result = execute('call sp_static_sites_new();', []);

send_json($result);
