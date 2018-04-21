<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_users_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_hero') ?></h2>
  <?= link_to(t('users'), '/admin/users.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
