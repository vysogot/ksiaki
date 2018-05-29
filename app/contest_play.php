<?php

include 'init.php';

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
  <h2><?= link_to(t('back_to_contest'), "/contest.php?id=" . $data['contest']->id) ?></h2>
  <iframe onload="this.contentWindow.focus()" style="border: 0; width: 100%; height: 80vh;" src="/games/<?= $data['game']->name ?>/index.html"></iframe>
</div>

<?php }

include 'layout.php';
