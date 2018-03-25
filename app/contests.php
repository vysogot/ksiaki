<?php

require 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_contests_all(
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

function content($params, $data) { ?>

<div class="wrapper">
  <div class="left-sidebar">
    <aside class="month-rank">
      <h2><?= t('monthly_ranking') ?></h2>
      <ol>
        <li>Kawazmlekiem</li>
        <li>Szija26</li>
        <li>ilovelego</li>
        <li>smerfetka</li>
        <li>Ewelina Ratajczak</li>
        <li>basiaJ</li>
        <li>ajanga</li>
        <li>mario75</li>
        <li>lottainaczejkar...</li>
        <li>lusia44</li>
      </ol>
    </aside>
  </div>

  <div class="main-area">
    <h2><?= t('play_and_win') ?></h2>
    <h3><?= t('contests_slogan') ?></h3>
    <ul class="bare left contests">
    <?php foreach($data as $contest) { ?>
      <li>
        <div>
          <img src="/uploads/contest-single.jpg">
          <?= link_to($contest->name, "/contests/show.php?id=$contest->id") ?>
        </div>
      </li>
    <?php } ?>
    </ul>
  </div>

  <div class="right-sidebar">
    <img src="/uploads/contest-ad.jpg">
  </div>
</div>

<?php }

require 'layout.php';
