<?php

include '../init.php';

$result = execute('call sp_hero_editions_new();', []);

send_json($result);
