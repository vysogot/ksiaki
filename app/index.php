<?php

require 'init.php';

function meta() { ?>
  <link rel="stylesheet" type="text/css" href="/assets/css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="/assets/css/slick-theme.css" />
<?php }

function content($params, $data) { ?>

<div class="wrapper">
  <section id="heroes" class="slider">
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
      <div><img src="/assets/images/hero-1.png"></div>
      <div><img src="/assets/images/hero-2.png"></div>
  </section>

  <section id="slider" class="slider">
    <div><img src="/assets/images/slider-1.jpg" /></div>
    <div><img src="/assets/images/slider-2.jpg" /></div>
    <div><img src="/assets/images/slider-3.jpg" /></div>
  </section>

  <section id="player">
    <!--<video controls poster="https://www.html5rocks.com/en/tutorials/video/basics/poster.png">
    <source src="https://www.html5rocks.com/en/tutorials/video/basics/devstories.webm"
            type='video/webm;codecs="vp8, vorbis"' />
    <source src="https://www.html5rocks.com/en/tutorials/video/basics/devstories.mp4"
            type='video/mp4;codecs="avc1.42E01E, mp4a.40.2"' />
    <track src="https://www.html5rocks.com/en/tutorials/video/basics/devstories-en.vtt" label="English subtitles"
           kind="subtitles" srclang="en" default />
  </video>-->
  </section>

  <section id="contests">
    <ul class="bare left">
      <li><img src="/assets/images/contest-1.jpg" /></li>
      <li><img src="/assets/images/contest-2.jpg" /></li>
      <li><img src="/assets/images/contest-3.jpg" /></li>
      <li><img src="/assets/images/contest-4.jpg" /></li>
      <li><img src="/assets/images/contest-5.jpg" /></li>
      <li><img src="/assets/images/contest-6.jpg" /></li>
      <li><img src="/assets/images/contest-7.jpg" /></li>
      <li><img src="/assets/images/contest-8.jpg" /></li>
      <li><img src="/assets/images/contest-9.jpg" /></li>
    </ul>
  </section>

  <section id="side-banners">
    <ul class="bare left">
      <li class="double"><img src="/assets/images/side-banner-1.jpg" /></li>
      <li><img src="/assets/images/side-banner-2.jpg" /></li>
      <li><img src="/assets/images/side-banner-3.jpg" /></li>
    </ul>
  </section>
</div>

<?php }

require 'layout.php';
