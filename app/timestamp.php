<?php

include 'init.php';

send_json(['timestamp' => time(), 'token' => get_csrf_token()]);
