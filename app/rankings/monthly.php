<?php

require '../init.php';

$params = [
  'offset' => 0,
  'limit' => 10
];

$params = array_merge($params, $_GET);

$data = execute('call sp_rankings_monthly(
  :p_date,
  :p_offset,
  :p_limit
);', array(
  array('p_date', $params['month'], PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);

?>

<h2><?= t('monthly_ranking') ?></h2>
<?= ranking_list($data) ?>
