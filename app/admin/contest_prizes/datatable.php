
<?php

include '../init.php';

$result = execute('call sp_contest_prizes_all();', [], true);

send_json(['data' => $result]);
