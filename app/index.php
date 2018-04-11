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

$data['contests'] = execute('call sp_contests_all(
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
        <div><img src="/uploads/box-2.jpg" /><p>Super nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/user-movies-3.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><img src="/uploads/box-1.jpg" /><p>Super nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/box-3.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Oli!</p></div>
        <div><img src="/uploads/box-4.jpg" /><p>Super nagrody!</p></div>
        <div><img src="/uploads/box-1.jpg" /><p>Świetne nagrody!</p></div>
        <div><video controls preload="none" poster="/uploads/box-2.jpg" src="uploads/movie-1.mov"></video><p>Nowy filmik Macieja!</p></div>
        <div><img src="/uploads/box-3.jpg" /><p>Super nagrody!</p></div>
      </div>
    </section>

</div>

<?php }

function before_body_close() { ?>

<script type="text/javascript">

$(document).on('ready', function() {

  // Slider
  $("#slajder").slick({
    dots: false,
    vertical: false,
    centerMode: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    infinite: true,
    arrows: false,
    lazyLoad: 'ondemand'
  });

  $("#player").slick({
    dots: false,
    vertical: false,
    centerMode: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: false,
    infinite: true,
    arrows: false,
    lazyLoad: 'ondemand'
  });

  $("#contests-slider, #movies-slider, #box-banners-slider").slick({
    variableWidth: true,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 4,
    lazyLoad: 'ondemand'
  })
  .on('mouseenter', '.slick-slide', function (e) {
    $(e.currentTarget).addClass('expanded-light');
  })
  .on('mouseleave', '.slick-slide', function(e) {
    $(e.currentTarget).removeClass('expanded-light');
  });

  // Player

  // Run autoplay videos to satisfy Chrome
  $("#player video[autoplay]").each(function(){ this.play(); });

  // Hide every link so it can be set to display: block in CSS
  $("#player video").each(function(){ $(this).next().next().hide(); });

  // Every video is muted at the begining with overlay to turn sound on
  $('#player .mute').click(function () {
    var mute = $(this);
    var video = $(this).prev()[0];

    video.muted = false;
    mute.fadeOut();
  });

  // When video is clicked it gets muted back
  $("#player video").click(function () {
    var mute = $($(this).next());
    var video = $(this)[0];

    video.muted = true;
    mute.fadeIn();
  })

  // When video ended display a call to action link
  .on('ended', function() {
    var cta = $($(this).next().next());
    var mute = $($(this).next());
    var video = $(this);

    video.hide();
    mute.hide();
    cta.show();

    // show another slick slide after a moment
    setTimeout(function () {
      $('#player').slick('slickNext');
      cta.hide();
    }, 1000);
  });

  // make sure video and mute are available
  $('#player').on('beforeChange', function(event, slick, currentSlide, nextSlide) {
    var video = $($(slick.$slides.get(currentSlide)).children('video:first-child')[0]);
    var mute = $($(video).next()[0]);

    mute.show();
    video.show();
  });

  // and play the video silently
  $('#player').on('afterChange', function(event, slick, currentSlide, nextSlide) {
    var video = $(slick.$slides.get(currentSlide)).children('video:first-child')[0];
    var mute = $($(video).next()[0]);

    video.muted = true;
    video.play();
  });

});
</script>

<?php }

require 'layout.php';
