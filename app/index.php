<?php

include 'init.php';

$params = [
  "offset" => 0,
  "limit" => 20
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

$data['slides'] = execute('call sp_slides_all(
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

$data['user_movies'] = execute('call sp_user_movies_sorted_by_likes(
  :p_offset,
  :p_limit
);', array(
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

$data['video_ads'] = execute('call sp_video_ads_all(
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

    <aside>
        <div class="sky-banner" id="index">
            <img class="ad" src="/uploads/sky-ad-3-narrow.jpg">
        </div>
    </aside>

    <section id="contests" class="slider">
      <h2><?= t('contests') ?></h2>
      <div id="contests-slider" class="boxes">
        <?php foreach($data['contests'] as $contest) { ?>
          <div>
            <?= link_to(image($contest->box_url), "/contest.php?id=$contest->id") ?>
            <p><?= link_to($contest->name, "/contest.php?id=$contest->id") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>

    <?php // include 'partials/user_movies_list.php'; ?>

    <section id="box-banners">
      <h2><?= t('box_banners') ?></h2>
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
