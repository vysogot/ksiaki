<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_video_ads_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_form', ['name' => t('video_ad')]) ?></h2>
  <?= link_to(t('video_ads'), '/admin/video_ads.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
