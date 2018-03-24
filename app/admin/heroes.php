<?php

require 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_heroes_all(
  :p_id,
  :p_name,
  :p_offset,
  :p_limit
);', array(
  array('p_id', $params['id'], PDO::PARAM_INT),
  array('p_name', $params['name'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('heroes') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/heroes/new.php') ?></p>
  <table>
    <?php foreach($data as $hero) { ?>
      <tr>
        <td><img height=75 src="<?= e($hero->avatar_url) ?>" /></td>
        <td><?= e($hero->name) ?></td>
        <td><?= e($hero->description) ?></td>
        <td><?= e($hero->avatar_url) ?></td>
        <td><?= e($hero->header_url) ?></td>
        <td><?= e($hero->is_active) ?></td>
        <td><?= link_to(t('show'), "/admin/heroes/show.php?id=$hero->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/heroes/edit.php?id=$hero->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/heroes/delete.php?id=$hero->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

require 'layout.php';
