<?php

include 'init.php';

$result = execute('call sp_users_activate(:p_activation_hash);', array(
  array('p_activation_hash', $_GET['key'], PDO::PARAM_INT)
));

if (!empty($result)) {
    flash('notice', t('activation_success'));
} else {
    flash('warning', t('activation_failure'));
}

redirect('/');
