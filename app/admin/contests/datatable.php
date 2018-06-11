
<?php

include '../init.php';

$result = execute('call sp_contests_all();', [], true);

send_json(['data' => $result]);
