<?php

require '../init.php';

$params = [
  'offset' => 0,
  'limit' => 10
];

$params = array_merge($params, $_GET);

$data = execute('call sp_rankings_contest(
  :p_contest_id,
  :p_offset,
  :p_limit
);', array(
  array('p_contest_id', $params['id'], PDO::PARAM_INT),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

?>

<h2><?= t('contest_ranking') ?></h2>
<div class="loaded"><?= ranking_list($data) ?></div>
