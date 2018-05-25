<?php

include '../init.php';

$result = execute('call sp_backgrounds_new();', []);

push_result2json($result);
