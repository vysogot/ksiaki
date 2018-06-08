<?php

include 'init.php';

$params = [
    "offset" => 0,
    "limit" => 10
];

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find_by_slug(:p_slug);', array(
    array('p_slug', $params['slug'], PDO::PARAM_INT)
));

$data['game'] = execute('call sp_games_find(:p_id);', array(
    array('p_id', $data['contest']->game_id, PDO::PARAM_INT)
));

$data['other_contests'] = execute('call sp_contests_all_but_one(:p_id);', array(
    array('p_id', $data['contest']->id, PDO::PARAM_INT)
), true);

$data['contest_ranking'] = execute('call sp_rankings_contest(
    :p_contest_id,
    :p_offset,
    :p_limit
);', array(
    array('p_contest_id', $data['contest']->id, PDO::PARAM_INT),
    array('p_offset', $params['offset'], PDO::PARAM_INT),
    array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div id="contests-page">
  <div class="wrapper">

  <h1 class="center"><?= $data['contest']->name ?></h1>
  <p class="center"><?= t($data['game']->description) ?></p>

  <div class="wrapper">
    <?php if ($data['contest']->display_ad) { ?>
        <h2 class="center"><?= link_to(t('play'), t('contest_preroll_slug', ['slug' => $data['contest']->slug])) ?></h2>
    <?php } else { ?>
        <h2 class="center"><?= link_to(t('play'), t('contest_play_slug', ['slug' => $data['contest']->slug])) ?></h2>
    <?php } ?>
    <div class="side rankings">
      <h2><?= link_to(t('contest_ranking', ['name' => $data['contest']->name]), '/ranking.php?type=contest&id=' . $data['contest']->id) ?></h2>
      <?= ranking_list($data['contest_ranking']) ?>
    </div>

    <?php include './partials/modal_ranking.html' ?>

    <div class="main">
      <h2 class="center"><?= t('other_contests') ?></h2>
      <?php foreach($data['other_contests'] as $contest) { ?>
        <div class="left box">
          <?= link_to("<img src='$contest->box_url'>", t('contest_slug', ['slug' => $contest->slug])) ?>
          <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
        </div>
      <?php } ?>
    </div>

    <?php include './partials/stroer_sky.html' ?>

  </div>
</div>

<?php }

include 'layout.php';
