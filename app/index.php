<?php

require 'init.php';

$params = [
  "id" => null,
  "name" => null,
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
  array('p_id', $params['id'], PDO::PARAM_INT),
  array('p_name', $params['name'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <div class="wrapper">
  <section id="heroes">
    <div id="heroes-slider">
      <?php foreach($data['heroes'] as $hero) { ?>
        <li>
          <div>
            <?= link_to("<img src='$hero->avatar_url' title='$hero->name'>", "/heroes/show.php?id=$hero->id") ?>
          </div>
        </li>
      <?php } ?>
    </div>
  </section>
  </div>
</div>

<div class="wrapper">

  <!-- <div id="sky-banner-left" class="sky-banner"></div> -->

  <!-- <div class="wrapper left"> -->

    <section id="slajder" class="slider">
      <div><img src="/uploads/slider-1.jpg" /></div>
      <div><img src="/uploads/slider-2.jpg" /></div>
      <div><img src="/uploads/slider-3.jpg" /></div>
    </section>

    <section id="player" class="slider">
      <div><video controls preload="none" poster="/uploads/movie-1.png" src="uploads/movie-1.mp4"></video></div>
      <div><video controls preload="none" poster="/uploads/movie-2.png" src="uploads/movie-1.mp4"></video></div>
    </section>

    <section id="contests" class="slider">
      <h2><?= t('contests') ?></h2>
      <div id="contests-slider" class="boxes">
        <div><img src="/uploads/box-1.jpg" /><p>Cudowny konkurs!</p></div>
        <div><img src="/uploads/box-2.jpg" /><p>Świetne nagrody!</p></div>
        <div><img src="/uploads/box-3.jpg" /><p>Cudowny konkurs!</p></div>
        <div><img src="/uploads/box-4.jpg" /><p>Świetne nagrody!</p></div>
        <div><img src="/uploads/box-3.jpg" /><p>Cudowny konkurs!</p></div>
        <div><img src="/uploads/box-2.jpg" /><p>Cudowny konkurs!</p></div>
        <div><img src="/uploads/box-1.jpg" /><p>Świetne nagrody!</p></div>
        <div><img src="/uploads/box-4.jpg" /><p>Cudowny konkurs!</p></div>
      </div>
    </section>


    <section id="movies">
      <h2><?= t('user_movies') ?></h2>
      <div id="movies-slider" class="boxes">
        <div><video controls preload="none" poster="/uploads/user-movies-1.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-2.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-4.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-2.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-4.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-1.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
      </div>
    </section>


    <section id="box-banners">
      <h2><?= t('box_banners') ?></h2>
      <div id="box-banners-slider" class="boxes">
        <div><img src="/uploads/box-2.jpg" /><p>Super nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><img src="/uploads/box-1.jpg" /><p>Super nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/box-3.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Oli!</p></div>
        <div><img src="/uploads/box-4.jpg" /><p>Super nagrody!</p></div>
        <div><img src="/uploads/box-1.jpg" /><p>Świetne nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/box-2.jpg" src="uploads/movie-1.mp4"></video><p>Nowy filmik Macieja!</p></div>
        <div><img src="/uploads/box-3.jpg" /><p>Super nagrody!</p></div>
      </div>
    </section>

  <!-- </div> -->

  <!-- <div id="sky-banner-left" class="sky-banner "></div> -->

</div>

<?php }

require 'layout.php';
