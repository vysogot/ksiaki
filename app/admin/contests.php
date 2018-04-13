<?php

$start_time = microtime(TRUE);

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_contests_all(
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
  <h2><?= t('contests') ?></h2>
  <p><?= link_to(t('add_new'), '/admin/contests/new.php') ?></p>
  <table>
    <?php foreach($data as $contest) { ?>
      <tr>
        <td><?= e($contest->name) ?></td>
        <td><?= link_to(t('show'), "/admin/contests/show.php?id=$contest->id") ?></td>
        <td><?= link_to(t('edit'), "/admin/contests/edit.php?id=$contest->id") ?></td>
        <td><?= link_to(t('delete'), "/admin/contests/delete.php?id=$contest->id", ['class' => 'confirmation']) ?></td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

include 'layout.php';

$end_time = microtime(TRUE);
echo $end_time - $start_time;
