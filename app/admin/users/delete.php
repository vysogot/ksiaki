<?php

include '../init.php';

$result = execute('call sp_users_delete(:p_id, p_deleted_by);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT),
  array('p_deleted_by', $_SESSION['user_id'], PDO::PARAM_INT)
));

if ($result->rowCount == 1) {
  flash('notice', t('delete_success'));
  redirect("index.php");
} else {
  flash('warning', t('delete_failure'));
  redirect('show.php?id=' . $result->lastInsertId);
}
