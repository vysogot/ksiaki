<?php

require 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
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

$data['monthly_ranking'] = execute('call sp_ranking(
  :p_interval,
  :p_date_start
);', array(
  array('p_interval', 1, PDO::PARAM_INT),
  array('p_date_start', date('Y-m-01'), PDO::PARAM_STR)
), true);

$data['yearly_ranking'] = execute('call sp_ranking(
  :p_interval,
  :p_date_start
);', array(
  array('p_interval', 12, PDO::PARAM_INT),
  array('p_date_start', date('2017-m-d'), PDO::PARAM_STR)
), true);

function content($params, $data) { ?>

<div class="wrapper">
  <h2 class="hidden"><?= t('contests') ?></h2>

  <div class="side rankings">
    <h2><?= t('monthly_ranking') ?></h2>
    <?= ranking_list($data['monthly_ranking']) ?>

    <h2><?= t('yearly_ranking') ?></h2>
    <?= ranking_list($data['yearly_ranking']) ?>
  </div>

  <div class="main">
    <?php foreach($data['contests'] as $contest) { ?>
      <div class="left box">
        <?= link_to("<img src='$contest->box_url'>", "/contests/show.php?id=$contest->id") ?>
        <p><?= link_to($contest->name, "/contests/show.php?id=$contest->id") ?></p>
      </div>
    <?php } ?>
  </div>

  <div class="side">
    <img class="ad" src="/uploads/sky-ad.jpg">
  </div>
</div>

<?php }

require 'layout.php';
