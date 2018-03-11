<?php

require '../init.php';

$params = [
  'id' => null,
  'form_action' => 'update.php'
];

$params = array_merge($params, $_GET);

$data = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">
    <h2><?= t('contest_edit') ?></h2>
    <?= link_to(t('contests'), '/admin/contests.php') ?>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
