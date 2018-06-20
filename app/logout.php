<?php

include 'init.php';

$result = execute('call sp_user_logout(:p_user_id, :p_session_id);', array(
    array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
    array('p_session_id', session_id(), PDO::PARAM_STR)
));

$_SESSION = array();

if (isset($_COOKIE[session_name()])) {
   setcookie(session_name(), '', time()-42000, '/');
}

session_destroy();

function content($params, $data) { ?>

<div class="wrapper">
  <div class="main-area">
    <h2><?= t('logged_out_safely') ?></h2>
  </div>
</div>

<?php }

include 'layout.php';
