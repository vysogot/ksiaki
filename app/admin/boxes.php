<?php

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "link_url" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_boxes_all(
  :p_id,
  :p_name,
  :p_link_url,
  :p_offset,
  :p_limit
);', array(
  array('p_id', $params['id'], PDO::PARAM_INT),
  array('p_name', $params['name'], PDO::PARAM_STR),
  array('p_link_url', $params['link_url'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('boxes') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/boxes/new.php') ?></p>
  <table>
    <?php foreach($data as $box) { ?>
      <tr>
        <td><img height=75 src="<?= e($box->image_url) ?>" /></td>
        <td><?= e($box->name) ?></td>
        <td><?= e($box->image_url) ?></td>
        <td><?= e($box->link_url) ?></td>
        <td><?= e($box->begins_at) ?></td>
        <td><?= e($box->ends_at) ?></td>
        <td><?= e($box->is_active) ?></td>
        <td><?= link_to(t('show'), "/admin/boxes/show.php?id=$box->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/boxes/edit.php?id=$box->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/boxes/delete.php?id=$box->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include 'layout.php';
