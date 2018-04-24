<?php

include 'init.php';

$params = [
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_users_find_all(
  :p_offset,
  :p_limit
);', array(
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('users') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/users/new.php') ?></p>
  <table>
    <?php foreach($data as $user) { ?>
      <tr>
        <td><?= e($user->name) ?></td>
        <td><?= link_to(t('show'), "/admin/users/show.php?id=$user->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/users/edit.php?id=$user->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/users/delete.php?id=$user->id", ['class' => 'confirmation']) ?>
        </td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include 'layout.php';
