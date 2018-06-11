
<?php

include '../init.php';

$result = execute('call sp_user_movies_all();', [], true);

send_json(['data' => $result]);
