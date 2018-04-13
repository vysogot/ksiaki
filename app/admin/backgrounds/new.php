<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_backgrounds_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_background') ?></h2>
  <?= link_to(t('backgrounds'), '/admin/backgrounds.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
