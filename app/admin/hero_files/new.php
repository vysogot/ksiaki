<?php

include '../init.php';

$result = execute('call sp_hero_files_new();', []);

send_json($result);
