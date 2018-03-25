<?php

require 'init.php';

function content($params, $data) { ?>

<div class="wrapper">
  <div class="side">
    <img class="ad" src="/uploads/sky-ad-2.jpg">
  </div>

  <div class="main">

    <h2><?= t('videos') ?></h2>
    <div class="left box"><video controls preload="none" poster="/uploads/user-movies-1.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
    <div class="left box"><video controls preload="none" poster="/uploads/user-movies-2.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>
    <div class="left box"><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
    <div class="left box"><video controls preload="none" poster="/uploads/user-movies-4.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>

    <h2><?= t('wallpapers') ?></h2>
    <div class="left box"><img src="/uploads/box-1.jpg" /><p>Cudowny konkurs!</p></div>
    <div class="left box"><img src="/uploads/box-2.jpg" /><p>Świetne nagrody!</p></div>
    <div class="left box"><img src="/uploads/box-3.jpg" /><p>Cudowny konkurs!</p></div>
    <div class="left box"><img src="/uploads/box-4.jpg" /><p>Świetne nagrody!</p></div>

  </div>

  <div class="side">
    <img class="ad" src="/uploads/sky-ad-3.jpg">
  </div>
</div>


<?php }

require 'layout.php';
