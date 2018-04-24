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

$data = execute('call sp_slides_all(
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
  <h2><?= t('slides') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/slides/new.php') ?></p>
  <table>
    <?php foreach($data as $slide) { ?>
      <tr>
        <td><img height=75 src="<?= e($slide->image_url) ?>" /></td>
        <td><?= e($slide->name) ?></td>
        <td><?= e($slide->image_url) ?></td>
        <td><?= e($slide->link_url) ?></td>
        <td><?= e($slide->begins_at) ?></td>
        <td><?= e($slide->ends_at) ?></td>
        <td><?= e($slide->is_active) ?></td>
        <td><?= link_to(t('show'), "/admin/slides/show.php?id=$slide->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/slides/edit.php?id=$slide->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/slides/delete.php?id=$slide->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include 'layout.php';
