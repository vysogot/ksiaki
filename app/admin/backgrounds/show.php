<?php

require '../init.php';

$params = [
  'id' => null
];

$params = array_merge($params, $_GET);

$data = execute('call sp_backgrounds_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">

    <h2><?= t('background') ?></h2>

    <?= link_to(t('backgrounds'), '/admin/backgrounds.php') ?>

    <?php foreach($data as $key => $value) { ?>
      <p><b><?= e($key) ?>:</b> <?= e($value) ?></p>
    <?php } ?>

    <?= link_to(t('edit'), "/admin/backgrounds/edit.php?id=$data->id") ?> |
    <?= link_to(t('delete'), "/admin/backgrounds/delete.php?id=$data->id", ['class' => 'confirmation']) ?>
  </div>

<?php }

require '../layout.php';
