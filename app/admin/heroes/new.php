<?php

include '../init.php';

$data = execute('call sp_heroes_new();', []);

push_result2json($result);
