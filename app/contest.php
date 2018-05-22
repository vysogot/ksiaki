<?php

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 4
];

$params = array_merge($params, $_GET);

$data['contest'] = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

$data['connected_contests'] = execute('call sp_contests_all(
  :p_id,
  :p_name,
  :p_offset,
  :p_limit
);', array(
  array('p_id', null, PDO::PARAM_INT),
  array('p_name', $params['name'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

$data['contest_ranking'] = execute('call sp_rankings_contest(
  :p_contest_id,
  :p_offset,
  :p_limit
);', array(
  array('p_contest_id', $params['id'], PDO::PARAM_INT),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

function content($params, $data) { ?>

<div id="contests-page">
  <div class="wrapper">

  <h1><?= $data['contest']->name ?></h1>

  <div class="wrapper">
    <h2 class="center"><?= link_to(t('play'), "/contest_preroll.php?id=" . $data['contest']->id) ?></h2>
    <div class="side rankings">
      <h2><?= link_to(t('contest_ranking', ['name' => $data['contest']->name]), '/ranking.php?type=contest&id=' . $data['contest']->id) ?></h2>
      <?= ranking_list($data['contest_ranking']) ?>
    </div>

    <?php include './partials/modal_ranking.html' ?>

    <div class="main">
      <h2><?= t('other_contests') ?></h2>
      <?php foreach($data['connected_contests'] as $contest) { ?>
        <div class="left box">
          <?= link_to("<img src='$contest->box_url'>", "/contest.php?id=$contest->id") ?>
          <p><?= link_to($contest->name, "/contest.php?id=$contest->id") ?></p>
        </div>
      <?php } ?>
    </div>

    <aside>
    <div class="side">
      <img class="ad" src="/uploads/sky-ad-3-narrow.jpg">
    </div>
    </aside>

  </div>
</div>

<?php }

include 'layout.php';
