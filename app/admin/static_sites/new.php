<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_static_sites_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_form', ['name' => t('static_site')]) ?></h2>
  <?= link_to(t('static_sites'), 'index.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
