
<?php

include '../init.php';

$result = execute('call sp_hero_files_all();', [], true);

send_json(['data' => $result]);
