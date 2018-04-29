<?php

include '../init.php';

$params = [
  "id" => null,
  "name" => null,
  "link_url" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_user_movies_all(
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
  <h2><?= t('user_movies') ?></h2>
  <p><?= link_to(t('add_new'), 'new.php') ?></p>
  <table>
    <?php foreach($data as $user_movie) { ?>
      <tr>
        <td><img height=75 src="<?= e($user_movie->image_url) ?>" /></td>
        <td><?= e($user_movie->name) ?></td>
        <td><?= e($user_movie->image_url) ?></td>
        <td><?= e($user_movie->link_url) ?></td>
        <td><?= e($user_movie->begins_at) ?></td>
        <td><?= e($user_movie->ends_at) ?></td>
        <td><?= e($user_movie->is_active) ?></td>
        <td><?= link_to(t('show'), "show.php?id=$user_movie->id") ?></td>
        <td><?= link_to(t('edit'), "edit.php?id=$user_movie->id") ?></td>
        <td><?= link_to(t('delete'), "delete.php?id=$user_movie->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include '../layout.php';
