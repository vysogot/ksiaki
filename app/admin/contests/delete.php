<?php

require '../init.php';

$params = [
  'id' => null
];

$params = array_merge($params, $_GET);

$result = execute('call sp_contests_delete(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

if ($result->rowCount == 1) {
  flash('notice', t('contest_delete_success'));
  redirect("/admin/contests.php");
} else {
  flash('warning', t('contest_delete_failure'));
  redirect('show.php?id=' . $result->lastInsertId);
}
