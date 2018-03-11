<?php

require 'init.php';

function meta() { ?>
  <link rel="stylesheet" type="text/css" href="/assets/css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="/assets/css/slick-theme.css" />
<?php }

function content($params, $data) { ?>

<div class="wrapper">
  <div class="wrapper">
  <section id="heroes">
    <div id="heroes-slider">
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
    </div>
  </section>
  </div>
</div>

<div class="wrapper">

  <!-- <div id="sky-banner-left" class="sky-banner"></div> -->

  <!-- <div class="wrapper left"> -->

    <section id="slajder" class="slider">
      <div><img src="/assets/images/slider-1.jpg" /></div>
      <div><img src="/assets/images/slider-2.jpg" /></div>
      <div><img src="/assets/images/slider-3.jpg" /></div>
    </section>

    <section id="player">
      <video controls poster="/assets/images/slider-1.jpg">
      <!--<source src="https://www.html5rocks.com/en/tutorials/video/basics/devstories.webm"
              type='video/webm;codecs="vp8, vorbis"' />
      <source src="https://www.html5rocks.com/en/tutorials/video/basics/devstories.mp4"
              type='video/mp4;codecs="avc1.42E01E, mp4a.40.2"' />
      <track src="https://www.html5rocks.com/en/tutorials/video/basics/devstories-en.vtt" label="English subtitles"
             kind="subtitles" srclang="en" default />-->
    </video>
    </section>

    <section id="contests" class="slider">
      <h2><?= t('contests') ?></h2>
      <div id="contests-slider">
        <div><img width=240 height=240 src="/assets/images/contest-1.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-2.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-3.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-4.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-1.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-2.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-3.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/contest-4.jpg" /></div>
      </div>
    </section>


    <section id="movies">
      <h2><?= t('user_movies') ?></h2>
      <div id="movies-slider">
        <div><video width=240 height=240 controls poster="/assets/images/contest-5.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-6.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-7.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-8.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-5.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-6.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-7.jpg"></video></div>
        <div><video width=240 height=240 controls poster="/assets/images/contest-8.jpg"></video></div>
      </div>
    </section>


    <section id="box-banners">
      <h2><?= t('box_banners') ?></h2>
      <div id="box-banners-slider">
        <div><img width=240 height=240 src="/assets/images/box-banner-1.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-2.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-3.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-4.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-1.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-2.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-3.jpg" /></div>
        <div><img width=240 height=240 src="/assets/images/box-banner-4.jpg" /></div>
      </div>
    </section>

  <!-- </div> -->

  <!-- <div id="sky-banner-left" class="sky-banner "></div> -->

</div>

<?php }

require 'layout.php';
