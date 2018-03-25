<?php

require '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_heroes_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_hero') ?></h2>
  <?= link_to(t('heroes'), '/admin/heroes.php') ?>
  <?php require '_form.php'; ?>
</div>

<?php }

require '../layout.php';
