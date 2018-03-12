<?php

require '../init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data['current_contest'] = execute('call sp_contests_find(:p_id);', array(
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

function content($params, $data) { ?>

<div id="contests-page">
  <div class="wrapper-full">
    <div class="contest-banner">
      <img src="/assets/images/contest-banner.jpg">
    </div>
  </div>

  <div class="wrapper">
    <h2 class="center"><?= link_to(t('play'), "/contests/preroll.php?id=" . $data['current_contest']->id) ?></h2>
    <div class="left-sidebar">
      <div class="month-rank">
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
      </div>

      <div class="quiz">
        <h2><?= t('quiz') ?></h2>
        <h3>Włoskie miasto, słynne z krzywej wieży to:</h3>
        <ul>
          <li>Odpowiedź 1</li>
          <li>Odpowiedź 1</li>
          <li>Odpowiedź 1</li>
        </ul>
        <a href="#"><?= t('answer') ?></a>
      </div>
    </div>

    <div class="main-area">
      <h2><?= t('play_and_win') ?></h2>
      <h3><?= t('contests_slogan') ?></h3>
      <ul>
      <?php foreach($data['connected_contests'] as $contest) { ?>
        <li>
          <div>
            <img src="/assets/images/contest-single.jpg">
            <?= link_to($contest->name, "/contests/show.php?id=$contest->id") ?>
          </div>
        </li>
      <?php } ?>
      </ul>
    </div>

    <div class="right-sidebar">
      <img src="/assets/images/contest-ad.jpg">
    </div>

  </div>
</div>

<?php }

require '../layout.php';
