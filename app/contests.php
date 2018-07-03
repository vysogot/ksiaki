<?php

include 'init.php';

$params = [
  "offset" => 0,
  "limit" => 10,
  "month" => date('Y-m-01'),
  "year" => date('Y-m-d'),
  'title' => t('contests')
];

$params = array_merge($params, $_GET);

$data['contests'] = fetch_all('call sp_contests_all_for_display();');

$data['monthly_ranking'] = fetch_all('call sp_rankings_monthly(
  :p_date,
  :p_offset,
  :p_limit
);', array(
  array('p_date', $params['month'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
));

$data['yearly_ranking'] = fetch_all('call sp_rankings_yearly(
  :p_date,
  :p_offset,
  :p_limit
);', array(
  array('p_date', $params['year'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div class="wrapper">
  <h2 class="hidden"><?= t('contests') ?></h2>

  <div class="side rankings">
    <h2><?= link_to(t('monthly_ranking'), '/rankings/index.php?type=monthly&date=' . params('month')) ?></h2>
    <?= ranking_list($data['monthly_ranking']) ?>

    <h2><?= link_to(t('yearly_ranking'), '/rankings/index.php?type=yearly&date=' . params('year')) ?></h2>
    <?= ranking_list($data['yearly_ranking']) ?>

    <?= image('/assets/images/nagroda-konkursiaka.png', ['class' => 'shadow']) ?>
  </div>

  <?php include './partials/modal_ranking.html' ?>

  <div class="main">
    <?php foreach($data['contests'] as $contest) { ?>
      <div class="left box <?php if (!$contest->playable) echo 'unplayable'; ?>">
        <?= link_to(image($contest->box_url), t('contest_slug', ['slug' => $contest->slug])) ?>
        <p><?= link_to($contest->name, t('contest_slug', ['slug' => $contest->slug])) ?></p>
      </div>
    <?php } ?>
  </div>

  <?php include './partials/stroer_sky.html' ?>

</div>

<?php }

include 'layout.php';
