<?php

require '../init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

$data['game'] = execute('call sp_games_find(:p_id);', array(
  array('p_id', $data['contest']->game_id, PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper center">
  <img class="ad" src="/uploads/wide-banner.jpg" />
  <h2><?= link_to(t('back_to_contest'), "/contests/show.php?id=" . $data['contest']->id) ?></h2>
  <iframe style="width: 100%; height: 100vh;" src="/games/<?= $data['game']->name ?>/index.html"></iframe>
  <img class="ad" src="/uploads/wide-banner-2.jpg" />
</div>

<?php }

require '../layout.php';
