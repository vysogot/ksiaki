<?php

require '../init.php';

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

  <img src="<?= $data['contest']->header_url ?>">

  <div class="wrapper">
    <h2 class="center"><?= link_to(t('play'), "/contests/preroll.php?id=" . $data['contest']->id) ?></h2>
    <div class="side rankings">
      <h2><?= link_to(t('contest_ranking'), '/rankings/contest.php?id=' . $data['contest']->id) ?></h2>
      <?= ranking_list($data['contest_ranking']) ?>
    </div>

    <div class="modal"><div class="modal-content"><span class="close">&times;</span><p></p></div></div>

    <script type="text/javascript">
    $('.rankings h2 a').click(function(event) {
      event.preventDefault();

      var href = $(this).attr('href');
      $('.modal-content p').load(href);
      $('.modal').show();
    });

    $('.modal .close').click(function() {
      $('.modal').hide();
    });
    </script>

    <div class="main">
      <h2><?= t('other_contests') ?></h2>
      <?php foreach($data['connected_contests'] as $contest) { ?>
        <div class="left box">
          <?= link_to("<img src='$contest->box_url'>", "/contests/show.php?id=$contest->id") ?>
          <p><?= link_to($contest->name, "/contests/show.php?id=$contest->id") ?></p>
        </div>
      <?php } ?>
    </div>

    <div class="side">
      <img class="ad" src="/uploads/sky-ad-3.jpg">
    </div>

  </div>
</div>

<?php }

require '../layout.php';
