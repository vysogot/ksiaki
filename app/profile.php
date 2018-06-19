<?php

include 'init.php';

$profile = execute('call sp_user_profile(:p_nick);', array(
  array('p_nick', $_GET['nick'], PDO::PARAM_STR)
));

$badge_image_urls = array_filter(explode(', ', $profile->badge_image_urls));
$badge_titles = array_filter(explode(', ', $profile->badge_titles));

?>

<h2><?= $profile->nick ?></h2>

<p><?= t('points_total') ?>: <?= $profile->points ?></p>
<p><?= t('contests') ?>: <?= $profile->contest_names ?></p>

<?= image($profile->rank_image_url, ["title" => t($profile->rank_title)]) ?>

<?php foreach($badge_image_urls as $index => $url) { ?>
    <?= image($url, ["title" => t($badge_titles[$index])]) ?>
<?php } ?>
