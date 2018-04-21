<?php

include '../init.php';

$params = [
  'id' => null,
  'form_action' => 'update.php'
];

$params = array_merge($params, $_GET);

$data = execute('call sp_users_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('edit_form', ['name' => $data->name]) ?></h2>
    <?= link_to(t('users'), '/admin/users.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
