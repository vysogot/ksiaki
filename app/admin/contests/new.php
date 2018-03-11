<?php

require '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_contests_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_contest') ?></h2>
  <?= link_to(t('contests'), '/admin/contests.php') ?>
  <?php require '_form.php'; ?>
</div>

<?php }

require '../layout.php';
