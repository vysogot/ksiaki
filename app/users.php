<?php

require 'init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_users_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper">
  <div class="main-area">
    <h2><?= t('profile') ?></h2>
    <p><?= t('name') ?>: <?= $data->name ?></p>
    <p><?= t('email') ?>: <?= $data->email ?></p>
    <p><?= t('points') ?>: </p>
  </div>
</div>

<?php }

require 'layout.php';
