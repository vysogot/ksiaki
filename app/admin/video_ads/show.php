<?php

include '../init.php';

$params = [
  'id' => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_video_ads_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">

    <h2><?= t('video_ad') ?></h2>

    <?= link_to(t('video_ads'), '/admin/video_ads.php') ?>

    <?php foreach($data as $key => $value) { ?>
      <p><b><?= e($key) ?>:</b> <?= e($value) ?></p>
    <?php } ?>

    <?= link_to(t('edit'), "/admin/video_ads/edit.php?id=$data->id") ?> |
    <?= link_to(t('delete'), "/admin/video_ads/delete.php?id=$data->id", ['class' => 'confirmation']) ?>
  </div>

<?php }

include '../layout.php';
