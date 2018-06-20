<?php

include '../init.php';

$result = execute('call sp_mail_templates_all();', [], true);

send_json(['data' => $result]);
