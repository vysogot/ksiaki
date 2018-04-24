<?php

include '../init.php';

$params = [
  'form_action' => 'create.php'
];

$data = execute('call sp_user_movies_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('new_form', ['name' => t('user_movie')]) ?></h2>
  <?= link_to(t('user_movies'), '/admin/user_movies.php') ?>
  <?php include '_form.php'; ?>
</div>

<?php }

include '../layout.php';
