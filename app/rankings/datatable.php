<?php
include '../init.php';

$title  = '';
$status = '';

$params = [
    'type' => '',
    'date' => date('Y-m-d'),
    'offset' => 0,
    'limit' => 100,
];

$params = array_merge($params, $_GET);

switch ($params['type']) {
    case 'contest':

        $contest = execute('call sp_contests_find(:p_id);', array(
            array('p_id', $params['date'], PDO::PARAM_INT)
        ));

        $title = t('contest_ranking') . ' "' . $contest->name . '"';
        if ($contest->status != 'ended') $status = t('unverified');

        $result = fetch_all('call sp_rankings_contest(
            :p_contest_id,
            :p_offset,
            :p_limit
        );', array(
            array('p_contest_id', $params['date'], PDO::PARAM_INT),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ));

        break;

    case 'monthly':

        $title = t('monthly_ranking');

        $result = fetch_all('call sp_rankings_monthly(
            :p_date,
            :p_offset,
            :p_limit
        );', array(
            array('p_date', $params['date'], PDO::PARAM_STR),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ));

        break;

    case 'yearly':

        $title = t('yearly_ranking');

        $result = fetch_all('call sp_rankings_yearly(
            :p_date,
            :p_offset,
            :p_limit
        );', array(
            array('p_date', $params['date'], PDO::PARAM_STR),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ));

        break;
}

send_json(['title' => $title, 'status' => $status, 'data' => $result]);


