<?php

require '../init.php';
require '_queries.php';

$params = [
  'ranking_type' => null,
  'range' => null,
  'offset' => 0,
  'limit' => 10
];

$params = array_merge($params, $_GET);

$data['ranking_title'] = t($params['ranking_type'] . '_ranking');

switch ($params['ranking_type']) {
  case 'monthly':
    $data['ranking'] = monthly_ranking($params['range']);
    break;
  case 'yearly':
    $data['ranking'] = yearly_ranking($params['range']);
    break;
  case 'contest':
    $data['ranking'] = contest_ranking($params['range']);
    break;
}

?>

<h2><?= $data['ranking_title'] ?></h2>
<?= ranking_list($data['ranking']) ?>
