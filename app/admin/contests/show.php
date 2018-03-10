<?php

require '../init.php';

$params = [
  'id' => null,
  'active_link' => 'contests'
];

$params = array_merge($params, $_GET);

$data = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">

    <h2>Dane konkursu</h2>

    <a href="/admin/contests.php">Konkursy</a>

    <?php foreach($data as $key => $value) { ?>
      <p><b><?= e($key) ?>:</b> <?= e($value) ?></p>
    <?php } ?>

    <a href="/admin/contests/edit.php?id=<?= $data->id ?>">Edytuj</a> |
    <form id="<?= "contest-$data->id" ?>" action="/admin/contests/delete.php" method="post">
      <input type="hidden" name="id" value="<?= $data->id ?>" />
      <button type="submit" class="confirmation" form="<?= "contest-$data->id" ?>">Usuń</button>
    </form>
  </div>

<?php }

require '../layout.php';
