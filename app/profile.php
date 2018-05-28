<?php

include 'init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_user_profile(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

?>

<h2><?= t('profile') ?></h2>
<p><?= t('name') ?>: <?= $data->name ?></p>
<p><?= t('nick') ?>: <?= $data->nick ?></p>
<p><?= t('email') ?>: <?= $data->email ?></p>
<p><?= t('points') ?>: <?= $data->points ?></p>
<p><?= t('badges') ?>: <?= $data->list_badge_id ?></p>
<p><?= t('contests') ?>: <?= $data->list_contest_id ?></p>
