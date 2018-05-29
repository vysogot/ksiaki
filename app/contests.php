<?php

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50,
  "month" => date('Y-m-01'),
  "year" => date('Y-m-d')
];

$params = array_merge($params, $_GET);

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

function content($params, $data) { ?>

<div class="wrapper">
  <h2 class="hidden"><?= t('contests') ?></h2>

  <div class="side rankings">
    <h2><?= link_to(t('monthly_ranking'), '/ranking.php?type=monthly&month=' . $params['month']) ?></h2>
    <?= ranking_list($data['monthly_ranking']) ?>

    <h2><?= link_to(t('yearly_ranking'), '/ranking.php?type=yearly&year=' . $params['year']) ?></h2>
    <?= ranking_list($data['yearly_ranking']) ?>
  </div>

  <?php include './partials/modal_ranking.html' ?>

  <div class="main">
    <?php foreach($data['contests'] as $contest) { ?>
      <div class="left box">
        <?= link_to(image($contest->box_url), "/contest.php?id=$contest->id") ?>
        <p><?= link_to($contest->name, "/contest.php?id=$contest->id") ?></p>
      </div>
    <?php } ?>
  </div>

  <?php include './partials/stroer_sky.html' ?>

</div>

<?php }

include 'layout.php';
