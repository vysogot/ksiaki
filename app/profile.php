<?php

include 'init.php';

$params = [
    'nick' => $_SESSION['nick'] ?? ''
];

$params = array_merge($params, $_GET);

$profile = execute('call sp_user_profile(:p_nick);', array(
  array('p_nick', $params['nick'], PDO::PARAM_STR)
));

$badge_image_urls = array_filter(explode(', ', $profile->badge_image_urls));
$badge_titles = array_filter(explode(', ', $profile->badge_titles));

?>

<h2>
    <?php if (!empty($profile->avatar_url)) { ?>
        <?= image($profile->avatar_url) ?>
    <?php } ?>
    <?= $profile->nick ?>
</h2>

<p><?= t('points_total') ?>: <?= $profile->points ?></p>

<?php if(!empty($profile->contest_names)) { ?>
    <p><?= t('contests') ?>: <?= $profile->contest_names ?></p>
<?php } ?>

<p>

    <?= image($profile->rank_image_url, ["title" => t($profile->rank_title)]) ?>

    <?php foreach($badge_image_urls as $index => $url) { ?>
        <?= image($url, ["title" => t($badge_titles[$index])]) ?>
    <?php } ?>

</p>

<?php if ($profile->nick == $_SESSION['nick']) { ?>
    <p><?= link_to(t('password_reset'), '/password_reset_request.php') ?></p>
    <p><?= link_to(t('invite_friends'), '/invite_friends.php') ?></p>

    <p><?= $profile->address ?></p>
<?php } ?>
