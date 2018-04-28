<?php

include 'init.php';

$params = [
    'offset' => 0,
    'limit' => 10,
];

$params = array_merge($params, $_GET);

if ($params['type'] == 'contest') {

    $contest = execute('call sp_contests_find(:p_id);', array(
        array('p_id', $params['id'], PDO::PARAM_INT)
    ));

    $data['title'] = t('contest_ranking', ['name' => $contest->name]);

    $data['ranking'] = execute('call sp_rankings_contest(
        :p_contest_id,
        :p_offset,
        :p_limit
    );', array(
        array('p_contest_id', $params['id'], PDO::PARAM_INT),
        array('p_offset', $params['offset'], PDO::PARAM_INT),
        array('p_limit', $params['limit'], PDO::PARAM_INT)
    ), true);

} elseif ($params['type'] == 'monthly') {

    $data['title'] = t('monthly_ranking');

    $data['ranking'] = execute('call sp_rankings_monthly(
        :p_date,
        :p_offset,
        :p_limit
    );', array(
        array('p_date', $params['month'], PDO::PARAM_STR),
        array('p_offset', $params['offset'], PDO::PARAM_INT),
        array('p_limit', $params['limit'], PDO::PARAM_INT)
    ), true);
} elseif ($params['type'] == 'yearly') {

    $data['title'] = t('yearly_ranking');

    $data['ranking'] = execute('call sp_rankings_yearly(
        :p_date,
        :p_offset,
        :p_limit
    );', array(
        array('p_date', $params['year'], PDO::PARAM_STR),
        array('p_offset', $params['offset'], PDO::PARAM_INT),
        array('p_limit', $params['limit'], PDO::PARAM_INT)
    ), true);

}

?>

<h2><?= $data['title'] ?></h2>
<div class="loaded"><?= ranking_list($data['ranking']) ?></div>
