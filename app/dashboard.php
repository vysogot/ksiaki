<?php

require 'init.php';

$data = execute('call sp_users_find(:p_id);', array(
  array('p_id', $_SESSION['user_id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper">
    <ul>
        <li>
            <?= link_to(t('logout'), '/logout.php') ?>
        </li>
    </ul>

    <h2><?= t('your_profile') ?></h2>

    <p><?= t('your_name') ?>: <?= $data->name ?></p>
    <p><?= t('your_email') ?>: <?= $data->email ?></p>
    <p><?= t('your_role') ?>: <?= $data->role_id ?></p>
</div>

<?php }

require 'layout.php';
