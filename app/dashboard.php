<?php

include 'init.php';

$data = execute('call sp_users_find(:p_id);', array(
  array('p_id', $_SESSION['user_id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper">
  <div class="main-area">
    <h2><?= t('your_profile') ?></h2>
    <p><?= t('your_name') ?>: <?= $data->name ?></p>
    <p><?= t('your_email') ?>: <?= $data->email ?></p>
    <p><?= t('your_role') ?>: <?= $data->role_id ?></p>
  </div>
</div>

<?php }

include 'layout.php';
