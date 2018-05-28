<?php

include 'init.php';

$params = [
  "nick" => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_user_profile(:p_nick);', array(
  array('p_nick', $params['nick'], PDO::PARAM_INT)
));

?>

<h2><?= t('profile') ?></h2>
<p><?= t('name') ?>: <?= $data->name ?></p>
<p><?= t('nick') ?>: <?= $data->nick ?></p>
<p><?= t('email') ?>: <?= $data->email ?></p>
<p><?= t('points') ?>: <?= $data->points ?></p>
<p><?= t('badges') ?>: <?= $data->list_badge_id ?></p>
<p><?= t('badges') ?>: <?= $data->badge_image_url ?></p>
<p><?= t('badges') ?>: <?= $data->badge_title ?></p>
<p><?= t('contests') ?>: <?= $data->list_contest_id ?></p>
<p><?= t('contests') ?>: <?= $data->list_contest_name ?></p>
