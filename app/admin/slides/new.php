<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_slides_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_form', ['name' => t('slide')]) ?></h2>
  <?= link_to(t('slides'), '/admin/slides.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
