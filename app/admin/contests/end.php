<?php

include '../init.php';

$result = execute('call sp_contests_ending(:p_contest_id, :p_user_id);', array(
  array('p_contest_id', $_GET['id'], PDO::PARAM_INT),
  array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
));

$laureats = fetch_all('call sp_contests_get_laureats(:p_contest_id);', array(
  array('p_contest_id', $_GET['id'], PDO::PARAM_INT),
));

foreach ($laureats as $laureate) {
    send_laureate_email($laureate->email, [
        'nick' => $laureate->nick,
        'contest_name' => $laureate->contest_name,
        'address_confirmation_link' => link_to(t('account_settings'), t('account_settings_slug'))
    ]);
}

send_json(['contest' => $result, 'laureats' => $laureats]);
