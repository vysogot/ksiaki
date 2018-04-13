<?php

include '../init.php';

$params = [
  'id' => null
];

$params = array_merge($params, $_GET);

$result = execute('call sp_backgrounds_delete(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

if ($result->rowCount == 1) {
  flash('notice', t('delete_success'));
  redirect("/admin/backgrounds.php");
} else {
  flash('warning', t('delete_failure'));
  redirect('show.php?id=' . $result->lastInsertId);
}
