
<?php

include '../init.php';

$result = execute('call sp_video_ads_all();', [], true);

send_json(['data' => $result]);
