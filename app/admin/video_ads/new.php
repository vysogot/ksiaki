<?php

include '../init.php';

$result = execute('call sp_video_ads_new();', []);

send_json($result);
