
<?php

include '../init.php';

$result = execute('call sp_slides_all();', [], true);

send_json(['data' => $result]);
