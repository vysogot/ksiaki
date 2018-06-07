<?php

include 'init.php';

function content($params, $data) { ?>

<ul>
  <li><?= link_to(t('home_page'), '/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('users'), '/admin/users/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('contests'), '/admin/contests/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('heroes'), '/admin/heroes/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('backgrounds'), '/admin/backgrounds/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('slides'), '/admin/slides/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('video_ads'), '/admin/video_ads/', ['class' => 'remote']) ?></li>
  <li><?= link_to(t('boxes'), '/admin/boxes/', ['class' => 'remote']) ?></li>
  <!-- <li><?= link_to(t('user_movies'), '/admin/user_movies/', ['class' => 'remote']) ?></li> -->
  <li><?= link_to(t('static_sites'), '/admin/static_sites/', ['class' => 'remote']) ?></li>
</ul>

<?php }

include 'layout.php';

?>
