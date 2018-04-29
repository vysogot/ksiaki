<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_boxes_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_form', ['name' => t('box')]) ?></h2>
  <?= link_to(t('boxes'), 'index.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
