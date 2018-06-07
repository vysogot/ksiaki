<?php

include '../init.php';

$result = execute('call sp_user_movies_new();', []);

send_json($result);
