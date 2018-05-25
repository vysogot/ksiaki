<?php

include '../init.php';

$result = execute('call sp_heroes_new();', []);

push_result2json($result);
