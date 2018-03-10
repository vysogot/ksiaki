<?php

require 'init.php';

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
  <h2>Użytkownicy</h2>
  <table>
    <?php foreach($data as $user) { ?>
      <tr>
        <td><?= e($user->name) ?></td>
        <td><a href="/admin/users/show.php?id=<?= $user->id ?>">Pokaż</a></td>
        <td><a href="/admin/users/edit.php?id=<?= $user->id ?>">Edytuj</a></td>
        <td>
          <form id="<?= "user-$user->id" ?>" action="/admin/users/delete.php" method="post">
            <input type="hidden" name="id" value="<?= $user->id ?>" />
            <button type="submit" class="confirmation" form="<?= "user-$user->id" ?>">Usuń</button>
          </form>
        </td>
      </tr>
    <?php } ?>
  </table>
</div>

<?php }

require 'layout.php';
