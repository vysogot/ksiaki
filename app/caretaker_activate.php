<?php

include 'init.php';

$result = execute('call sp_users_caretaker_activate(:p_activation_hash);', array(
  array('p_activation_hash', $_GET['key'], PDO::PARAM_INT)
));

if (!empty($result)) {
    flash('notice', t('caretaker_activation_success'));
} else {
    flash('warning', t('caretaker_activation_failure'));
}

redirect('/');
