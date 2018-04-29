<?php

include '../init.php';

$params = [
  "id" => null,
  "title" => null,
  "slug" => null,
  "content" => null,
  "is_active" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_static_sites_all(
    :p_id,
    :p_title,
    :p_slug,
    :p_content,
    :p_is_active,
    :p_offset,
    :p_limit
);', array(
    array('p_id', $params['id'], PDO::PARAM_INT),
    array('p_title', $params['title'], PDO::PARAM_STR),
    array('p_slug', $params['slug'], PDO::PARAM_STR),
    array('p_content', $params['content'], PDO::PARAM_STR),
    array('p_is_active', $params['is_active'], PDO::PARAM_INT),
    array('p_offset', $params['offset'], PDO::PARAM_INT),
    array('p_limit', $params['limit'], PDO::PARAM_INT),
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('static_sites') ?></h2>
  <p><?= link_to(t('add_new'), 'new.php') ?></p>
  <table>
    <?php foreach($data as $static_site) { ?>
      <tr>
        <td><?= e($static_site->title) ?></td>
        <td><?= e($static_site->slug) ?></td>
        <td><?= e(substr($static_site->content, 0, 100)) ?></td>
        <td><?= e($static_site->is_active) ?></td>
        <td><?= link_to(t('show'), "show.php?id=$static_site->id") ?></td>
        <td><?= link_to(t('edit'), "edit.php?id=$static_site->id") ?></td>
        <td><?= link_to(t('delete'), "delete.php?id=$static_site->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include '../layout.php';
