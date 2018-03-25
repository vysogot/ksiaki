<?php

require '../init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

function content($params, $data) { ?>

<div class="wrapper center">
  <video controls preload="none" poster="/uploads/movie-1.png" src="/uploads/movie-1.mp4"></video>
  <h2 class="center"><?= link_to(t('play'), "/contests/play.php?id=" . $params['id']) ?></h2>
</div>

<?php }

require '../layout.php';
