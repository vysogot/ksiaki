
<?php

include '../init.php';

$result = execute('call sp_boxes_all();', [], true);

send_json(['data' => $result]);
