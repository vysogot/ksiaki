<?php

include 'init.php';

$data['slides'] = execute('call sp_slides_all();', [], true);
$data['video_ads'] = execute('call sp_video_ads_all();', [], true);
$data['contests'] = execute('call sp_contests_all();', [], true);
$data['boxes'] = execute('call sp_boxes_all();', [], true);

// $data['user_movies'] = execute('call sp_user_movies_sorted_by_likes();', [], true);

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
            <video controls <?= $options ?> poster="<?= $video_ad->image_url ?>" src="<?= $video_ad->video_url ?>"></video>
                <div class="mute"></div>
                <?= link_to(image($video_ad->image_url), $video_ad->link_url) ?>
            </div>
    <?php } ?>
    </section>

    <?php include './partials/stroer_sky.html' ?>

    <section id="contests" class="slider">
      <div id="contests-slider" class="boxes">
        <?php foreach($data['contests'] as $contest) { ?>
          <div>
            <?= link_to(image($contest->box_url), t('contest_slug', ['slug' => $contest->slug])) ?>
            <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
          </div>
        <?php } ?>
      </div>
    </section>

    <?php // include 'partials/user_movies_list.php'; ?>

    <section id="box-banners">
      <div id="box-banners-slider" class="boxes">
        <?php foreach($data['boxes'] as $box) { ?>
          <div>
            <?= link_to(image($box->image_url), $box->link_url) ?>
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
