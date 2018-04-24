<?php

include 'init.php';

$params = [
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data['heroes'] = execute('call sp_heroes_all(
  :p_id,
  :p_name,
  :p_offset,
  :p_limit
);', array(
  array('p_id', NULL, PDO::PARAM_INT),
  array('p_name', NULL, PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

$data['contests'] = execute('call sp_contests_all(
  :p_id,
  :p_name,
  :p_offset,
  :p_limit
);', array(
  array('p_id', NULL, PDO::PARAM_INT),
  array('p_name', NULL, PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

$data['boxes'] = execute('call sp_boxes_all(
  :p_id,
  :p_name,
  :p_link_url,
  :p_offset,
  :p_limit
);', array(
  array('p_id', NULL, PDO::PARAM_INT),
  array('p_name', NULL, PDO::PARAM_STR),
  array('p_link_url', NULL, PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);



function content($params, $data) { ?>

<div class="wrapper">

    <section id="slajder" class="slider">
      <div><img src="/uploads/slider-1.jpg" /></div>
      <div><img src="/uploads/slider-2.jpg" /></div>
      <div><img src="/uploads/slider-3.jpg" /></div>
    </section>

    <section id="player" class="slider">
      <div>
        <video controls autoplay muted poster="/uploads/movie-1.jpg" src="/uploads/movie-1.mov"></video>
        <div class="mute"></div>
        <?= link_to('<img src="/uploads/movie-cta.jpg" />', 'http://konkursiaki.pl') ?>
      </div>
      <div>
        <video controls preload="none" muted poster="/uploads/movie-2.jpg" src="/uploads/movie-2.mov"></video>
        <div class="mute"></div>
        <?= link_to('<img src="/uploads/movie-cta.jpg" />', 'http://konkursiaki.pl') ?>
      </div>
    </section>

    <section id="contests" class="slider">
      <h2><?= t('contests') ?></h2>
      <div id="contests-slider" class="boxes">
        <?php foreach($data['contests'] as $contest) { ?>
          <div>
            <?= link_to("<img src='$contest->box_url'>", "/contests/show.php?id=$contest->id") ?>
            <p><?= link_to($contest->name, "/contests/show.php?id=$contest->id") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>


    <section id="movies">
      <h2><?= t('user_movies') ?></h2>
      <div id="movies-slider" class="boxes">
        <div><video controls preload="none" poster="/uploads/user-movies-1.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-2.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-4.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-2.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-4.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-1.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
      </div>
    </section>


    <section id="box-banners">
      <h2><?= t('box_banners') ?></h2>
      <div id="box-banners-slider" class="boxes">
        <?php foreach($data['boxes'] as $box) { ?>
          <div>
            <?= link_to("<img src='$box->image_url'>", "$box->link_url") ?>
            <p><?= link_to($box->name, "$box->link_url") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>

</div>

<?php }

function before_body_close() {
    include 'partials/sliders_and_player_script.html';
}

include 'layout.php';
