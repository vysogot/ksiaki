<?php

include 'init.php';

$params = [
  "nick" => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_user_profile(:p_nick);', array(
  array('p_nick', $params['nick'], PDO::PARAM_INT)
));

$badge_image_urls = explode(', ', $data->badge_image_urls);
$badge_titles = explode(', ', $data->badge_titles);

?>

<h2><?= $data->nick ?></h2>
<p><?= t('points_total') ?>: <?= $data->points ?></p>
<p><?= t('contests') ?>: <?= $data->contest_names ?></p>
<?= image('/uploads/ranks/' . $data->rank_image_url, ["title" => $data->rank_title]) ?>
<?php foreach($badge_image_urls as $index => $url) { ?>
    <?= image('/uploads/badges/' . $url, ["title" => t($badge_titles[$index])]) ?>
<?php } ?>
