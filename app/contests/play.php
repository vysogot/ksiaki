<?php

require '../init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

$contest = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

$data = execute('call sp_games_find(:p_id);', array(
  array('p_id', $contest->game_id, PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper center">
  <img class="ad" src="/uploads/wide-banner.jpg" />
  <iframe style="width: 100%; height: 100vh;" src="/games/<?= $data->name ?>/index.html"></iframe>
  <img class="ad" src="/uploads/wide-banner-2.jpg" />
</div>

<?php }

require '../layout.php';
