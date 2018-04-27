<?php

include '../init.php';

$result = execute('call sp_video_ads_delete(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT)
));

if ($result->rowCount == 1) {
  flash('notice', t('delete_success'));
  redirect("/admin/video_ads.php");
} else {
  flash('warning', t('delete_failure'));
  redirect('show.php?id=' . $_GET['id']);
}
