<?php

include 'init.php';

$params = [
    "offset" => 0,
    "limit" => 10,
    "month" => date('Y-m-01'),
    "year" => date('Y-m-d')
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

$data['contest_prizes'] = execute('call sp_contest_prizes_by_contest_id(:p_id);', array(
    array('p_id', $data['contest']->id, PDO::PARAM_INT)
), true);

$data['monthly_ranking'] = execute('call sp_rankings_monthly(
  :p_date,
  :p_offset,
  :p_limit
);', array(
  array('p_date', $params['month'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

$data['yearly_ranking'] = execute('call sp_rankings_yearly(
  :p_date,
  :p_offset,
  :p_limit
);', array(
  array('p_date', $params['year'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
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
  <div class="full-wrapper contest-header" style="background: url('<?= $data['contest']->header_url ?>') center top no-repeat">
    <h1 class="center"><?= $data['contest']->name ?></h1>
    <p class="center"><?= t($data['game']->description) ?></p>
    <?php if ($data['contest']->display_ad) { ?>
        <h2 class="center"><?= link_to(t('play'), t('contest_preroll_slug', ['slug' => $data['contest']->slug])) ?></h2>
    <?php } else { ?>
        <h2 class="center"><?= link_to(t('play'), t('contest_play_slug', ['slug' => $data['contest']->slug])) ?></h2>
    <?php } ?>
  </div>

  <div class="wrapper">

    <div class="side rankings">
      <h2><?= link_to(t('contest_ranking', ['name' => $data['contest']->name]), '/rankings/index.php?type=contest&date=' . $data['contest']->id) ?></h2>
      <?= ranking_list($data['contest_ranking']) ?>

      <h2><?= link_to(t('monthly_ranking'), '/rankings/index.php?type=monthly&date=' . $params['month']) ?></h2>
      <?= ranking_list($data['monthly_ranking']) ?>

      <h2><?= link_to(t('yearly_ranking'), '/rankings/index.php?type=yearly&date=' . $params['year']) ?></h2>
      <?= ranking_list($data['yearly_ranking']) ?>
    </div>

    <?php include './partials/modal_ranking.html' ?>

    <div class="main">

    <?php if (!empty($data['contest_prizes'])) { ?>
        <h2 class="center"><?= t('prizes_in_this_contest') ?></h2>
        <?php foreach($data['contest_prizes'] as $prize) { ?>
          <div class="left box">
            <?= link_to(image($prize->image_url), t('contest_prize_slug', ['slug' => $prize->id]), ['class' => 'modal-remote', 'data-modal-class' => 'prize']) ?>
            <p><?= link_to($prize->name, t('contest_prize_slug', ['slug' => $prize->id]), ['class' => 'modal-remote', 'data-modal-class' => 'prize']) ?></p>
          </div>
        <?php } ?>
      <?php } ?>


    <?php if (!empty($data['other_contests'])) { ?>

      <h2 class="center"><?= t('other_contests') ?></h2>
      <?php foreach($data['other_contests'] as $contest) { ?>
        <div class="left box">
          <?= link_to(image($contest->box_url), t('contest_slug', ['slug' => $contest->slug])) ?>
          <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
        </div>
      <?php } ?>
      <?php } ?>
    </div>

    <?php include './partials/stroer_sky.html' ?>

  </div>
</div>

<?php }

include 'layout.php';
