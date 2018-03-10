<?php



$start_time = microtime(TRUE);

require 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50,
  'active_link' => 'contests'
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
  <h2>Ustawienia konkursów</h2>
  <p><a href="/admin/contests/new.php">Dodaj konkurs</a></p>
  <table>
    <?php foreach($data as $contest) { ?>
      <tr>
        <td><?= e($contest->name) ?></td>
        <td><a href="/admin/contests/show.php?id=<?= $contest->id ?>">Pokaż</a></td>
        <td><a href="/admin/contests/edit.php?id=<?= $contest->id ?>">Edytuj</a></td>
        <td>
          <form id="<?= "contest-$contest->id" ?>" action="/admin/contests/delete.php" method="post">
            <input type="hidden" name="id" value="<?= $contest->id ?>" />
            <button type="submit" class="confirmation" form="<?= "contest-$contest->id" ?>">Usuń</button>
          </form>
        </td>
      </tr>
    <?php } ?>
  </table>
  <h3>Ustawienia tapet</h3>
  <form action="backgrounds.php" method="post" id="backgrounds">
    <label>Tapeta Konkursy</label><br/>
    <input name="background[0][url]" placeholder="Tapeta Konkursy" type="file"><br />
    <input name="contests_background[0][link_url]" placeholder="Link url" type="text"><br />
    <label>Tapeta rotacyjna Konkursy</label><br/>
    <input name="contests_background[1][url]" placeholder="Tapeta rotacyjna Konkursy" type="file"><br />
    <input name="contests_background[1][link_url]" placeholder="Link url" type="text"><br />
  </form>
  <button type="submit" form="backgrounds" value="Wyślij">Wyślij</button>
</div>

<?php }

require 'layout.php';



$end_time = microtime(TRUE);

echo $end_time - $start_time;
