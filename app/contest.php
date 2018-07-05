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

if (empty($data['contest']) || (!$data['contest']->is_active && !is_admin())) redirect('/404.php');

$params['title'] = $data['contest']->name;

$data['game'] = execute('call sp_games_find(:p_id);', array(
    array('p_id', $data['contest']->game_id, PDO::PARAM_INT)
));

if (is_logged_in()) {
  $result = execute('call sp_score_games_find_max_by_contest_and_user_id(
    :p_contest_id,
    :p_user_id
  );', array(
      array('p_contest_id', $data['contest']->id, PDO::PARAM_INT),
      array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT)
  ));

  $data['current_user_score'] = $result->points;
}

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
    <p class="center description smaller-font">
        <?php if (!empty($data['contest']->description)) { ?>
            <?= $data['contest']->description ?>
        <?php } else { ?>
            <?= t($data['game']->description) ?>
        <?php } ?>

        <?php if (isset($data['current_user_score']) && !empty($data['current_user_score'])) { ?>

            <span class="bold bigger-font block margin-top-10">
              <?= t('your_best_score') ?>
              <span class="red">
                <?= polish_number_format($data['current_user_score']) ?>
              </span>
            </span>

        <?php } ?>
    </p>

    <h2 class="center">
      <?php if (!$data['contest']->is_active) { ?>
          <?= t('contest_inactive') ?>
      <?php } elseif ($data['contest']->yet_to_begin) { ?>
          <?= t('contest_yet_to_begin') ?>
      <?php } elseif ($data['contest']->is_ended || !$data['contest']->playable) { ?>
          <?= t('contest_ended') ?>
      <?php } else { ?>
          <?= link_to(t('play'), t('contest_play_slug', ['slug' => $data['contest']->slug])) ?>
      <?php } ?>
    </h2>

    <p class="bold bigger-font">
        <span class="left"><?= t('contest_starts', ['date' => date('d.m', strtotime($data['contest']->begins_at))]) ?></span>
        <span class="right"><?= t('contest_ends', ['date' => date('d.m', strtotime($data['contest']->ends_at))]) ?></span>
    </p>
    <p class="center smaller-font">
        <?= t('contest_statute_consent', ['link' => link_to(t('statute'), '/contest_statute.php?slug=' . params('slug'), ['class' => 'modal-remote', 'data-modal-class' => 'wide-text'])]) ?>
    </p>
  </div>

  <div class="wrapper">

    <div class="side rankings">
      <h2><?= link_to(t('contest_ranking', ['name' => $data['contest']->name]), '/rankings/index.php?type=contest&date=' . $data['contest']->id) ?></h2>
      <?= ranking_list($data['contest_ranking']) ?>

      <h2><?= link_to(t('monthly_ranking'), '/rankings/index.php?type=monthly&date=' . params('month')) ?></h2>
      <?= ranking_list($data['monthly_ranking']) ?>

      <h2><?= link_to(t('yearly_ranking'), '/rankings/index.php?type=yearly&date=' . params('year')) ?></h2>
      <?= ranking_list($data['yearly_ranking']) ?>
    </div>

    <?php include './partials/modal_ranking.html' ?>

    <div class="main">

    <?php if (!empty($data['contest_prizes'])) { ?>
      <h2 class="center"><?= t('prizes_in_this_contest') ?></h2>
      <section id="prizes" class="slider box-slider-container">
        <div id="prizes-slider" class="boxes">
        <?php foreach($data['contest_prizes'] as $prize) { ?>
          <div>
            <?= link_to(image($prize->image_url), t('contest_prize_slug', ['slug' => $prize->id]), ['class' => 'modal-remote', 'data-modal-class' => 'wide']) ?>
            <p><?= link_to($prize->name, t('contest_prize_slug', ['slug' => $prize->id]), ['class' => 'modal-remote', 'data-modal-class' => 'wide']) ?></p>
          </div>
        <?php } ?>
      </section>
    <?php } ?>


    <?php if (!empty($data['other_contests'])) { ?>

      <h2 class="center"><?= t('other_contests') ?></h2>
      <section id="otherContests" class="slider box-slider-container">
        <div id="other-contests-slider" class="boxes">
          <?php foreach($data['other_contests'] as $contest) { ?>
            <div <?php if (!$contest->playable) echo 'class="unplayable"'; ?>>
              <?= link_to(image($contest->box_url), t('contest_slug', ['slug' => $contest->slug])) ?>
              <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
            </div>
          <?php } ?>
        </div>
      </section>
    <?php } ?>

    </div>

    <aside class="sky-banner">
      <?php include './partials/stroer_sky.html' ?>
      <?php include './partials/konkursiak_of_the_month.php' ?>
    </aside>

    <script>
      $(document).on('ready', function() {

        $("#prizes-slider, #other-contests-slider").slick({
            variableWidth: true,
            infinite: false,
            slidesToShow: 2,
            slidesToScroll: 2,
            lazyLoad: 'ondemand'
        })
            .on('mouseenter', '.slick-slide', function (e) {
                $(e.currentTarget).addClass('expanded-light');
            })
            .on('mouseleave', '.slick-slide', function(e) {
                $(e.currentTarget).removeClass('expanded-light');
            });

      });
    </script>

  </div>
</div>

<?php }

include 'layout.php';
