<?php

include '../init.php';

$mail = fetch_one('call sp_log_mail_find(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_INT)
));

?>

<p>
    <?= $mail->email ?>
</p>

<h4>
    <?= $mail->subject ?>
</h4>

<p>
    <?= $mail->body ?>
<p>
