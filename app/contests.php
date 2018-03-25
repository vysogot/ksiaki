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
  <h2 class="hidden"><?= t('contests') ?></h2>

  <div class="side rankings">
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

    <h2><?= t('yearly_ranking') ?></h2>
    <ol>
      <li>Ewelina Ratajczak</li>
      <li>basiaJ</li>
      <li>ajanga</li>
      <li>mario75</li>
      <li>lottainaczejkar...</li>
      <li>lusia44</li>
      <li>Kawazmlekiem</li>
      <li>Szija26</li>
      <li>ilovelego</li>
      <li>smerfetka</li>
    </ol>
  </div>

  <div class="main">
    <?php foreach($data as $contest) { ?>
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
