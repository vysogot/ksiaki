<?php

include '../init.php';

$result = execute('call sp_slides_new();', []);

send_json($result);
