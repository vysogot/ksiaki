<?php

require '../init.php';

$params = [
  'active_link' => 'contests'
];

$data = [
  'game_name' => 'sorcerer',
  'game_url' => '/games/sorcerer/index.html'
];

function content($params, $data) { ?>

<div class="wrapper center">
  <h2>Gra</h2>

  <iframe style="width: 100%; height: 100vh;" src="<?= $data['game_url'] ?>"></iframe>

</div>

<?php }

require '../layout.php';
