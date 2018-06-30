<?php

include '../init.php';

$result = fetch_all('call sp_log_mail_all();');

send_json(['data' => $result]);
