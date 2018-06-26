<?php

include 'init.php';

$data['slides'] = fetch_all('call sp_slides_all_for_display();');
$data['video_ads'] = fetch_all('call sp_video_ads_all_for_display();');
$data['contests'] = fetch_all('call sp_contests_all_for_display();');
$data['boxes'] = fetch_all('call sp_boxes_all_for_display();');

// $data['user_movies'] = fetch_all('call sp_user_movies_sorted_by_likes();');

function content($params, $data) { ?>

<div class="wrapper">

    <section id="slajder" class="slider">
        <?php foreach($data['slides'] as $slide) { ?>
          <div>
            <?= link_to(image($slide->image_url), $slide->link_url) ?>
            <p><?= link_to($slide->name, $slide->link_url) ?></p>
          </div>
        <?php } ?>
    </section>

    <section id="player" class="slider">
    <?php reset($data['video_ads']); $first = key($data['video_ads']);
        foreach($data['video_ads'] as $key => $video_ad) { ?>
            <?php $options = ($key == $first) ? 'autoplay' : 'muted preload="none"' ?>
            <div>
            <video controls <?= $options ?> poster="<?= secure_url($video_ad->image_url) ?>" src="<?= secure_url($video_ad->video_url) ?>" type="video/mp4"></video>
                <div class="mute"></div>
                <?= link_to(image($video_ad->image_url), $video_ad->link_url) ?>
            </div>
    <?php } ?>
    </section>

    <?php include './partials/stroer_sky.html' ?>

    <div class="main">

<?php if (!empty($data['contests'])) { ?>

    <section id="contests" class="slider box-slider-container">
      <div id="contests-slider" class="boxes">
        <?php foreach($data['contests'] as $contest) { ?>
          <div>
            <?= link_to(image($contest->box_url), t('contest_slug', ['slug' => $contest->slug])) ?>
            <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
          </div>
        <?php } ?>
      </div>
    </section>

<?php } ?>

    <?php // include 'partials/user_movies_list.php'; ?>

<?php if (!empty($data['boxes'])) { ?>
    <section id="box-banners" class="slider box-slider-container">
      <div id="box-banners-slider" class="boxes">
        <?php foreach($data['boxes'] as $box) { ?>
          <div>
            <?= link_to(image($box->image_url), $box->link_url) ?>
            <p><?= link_to($box->name, "$box->link_url") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>
<?php } ?>

  <div class="clear">
    <?= image('/assets/images/konkursiak-roku.jpg', ['class' => 'shadow']) ?>
  </div>

  </div>

  <?php include './partials/app_sky_banner.php' ?>

</div>

<?php }

function before_body_close() {
    include 'partials/sliders_and_player_script.html';
}

include 'layout.php';
