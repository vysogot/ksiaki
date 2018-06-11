<?php
include '../init.php';

$title = '';
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

        $title = t('contest_ranking') . ' ' . $contest->name;

        $result = execute('call sp_rankings_contest(
            :p_contest_id,
            :p_offset,
            :p_limit
        );', array(
            array('p_contest_id', $params['date'], PDO::PARAM_INT),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ), true);
        break;
    case 'monthly':
        $title = t('monthly_ranking');

        $result = execute('call sp_rankings_monthly(
            :p_date,
            :p_offset,
            :p_limit
        );', array(
            array('p_date', $params['date'], PDO::PARAM_STR),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ), true);
        break;
    case 'yearly':
        $title = t('yearly_ranking');

        $result = execute('call sp_rankings_yearly(
            :p_date,
            :p_offset,
            :p_limit
        );', array(
            array('p_date', $params['date'], PDO::PARAM_STR),
            array('p_offset', $params['offset'], PDO::PARAM_INT),
            array('p_limit', $params['limit'], PDO::PARAM_INT)
        ), true);
        break;
}

send_json(['title' => $title, 'data' => $result]);

?>


