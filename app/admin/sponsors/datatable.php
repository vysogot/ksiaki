
<?php

include '../init.php';

$result = execute('call sp_sponsors_all();', [], true);

send_json(['data' => $result]);
