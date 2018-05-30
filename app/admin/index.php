<?php

include 'init.php';

function content($params, $data) { ?>

<ul>
  <li><?= link_to(t('home_page'), '/') ?></li>
  <li><?= link_to(t('users'), '/admin/users/') ?></li>
  <li><?= link_to(t('contests'), '/admin/contests/') ?></li>
  <li><?= link_to(t('heroes'), '/admin/heroes/') ?></li>
  <li><?= link_to(t('backgrounds'), '/admin/backgrounds/') ?></li>
  <li><?= link_to(t('slides'), '/admin/slides/') ?></li>
  <li><?= link_to(t('video_ads'), '/admin/video_ads/') ?></li>
  <li><?= link_to(t('boxes'), '/admin/boxes/') ?></li>
  <!-- <li><?= link_to(t('user_movies'), '/admin/user_movies/') ?></li> -->
  <li><?= link_to(t('static_sites'), '/admin/static_sites/') ?></li>
</ul>

<?php }

include 'layout.php';

?>
