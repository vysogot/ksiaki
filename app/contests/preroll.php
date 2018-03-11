<?php

require '../init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

function content($params, $data) { ?>

<div class="wrapper center">
  <section id="preroll">
    <video controls>
    </video>
  </section>
  <h2 class="center"><?= link_to(t('play'), "/contests/play.php?id=" . $params['id']) ?></h2>
</div>

<?php }

require '../layout.php';
