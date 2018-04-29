<?php

include '../init.php';

$params = [
  'id' => null,
  'form_action' => 'update.php'
];

$params = array_merge($params, $_GET);

$data = execute('call sp_heroes_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('edit_form') ?></h2>
    <?= link_to(t('heroes'), 'index.php') ?>
    <?php include '_form.php'; ?>
  </div>

<?php }

include '../layout.php';
