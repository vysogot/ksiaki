<?php

include 'init.php';

$prize = execute('call sp_contest_prizes_find(:p_id);', array(
  array('p_id', $_GET['id'], PDO::PARAM_STR)
));

?>

<h2><?= $prize->name ?></h2>

<p>
    <?= $prize->description ?>
</p>

<p>
    <?= image($prize->image_url) ?></p>
</p>

<p>
    <?= t('sponsor') ?>:
    <?= $prize->sponsor_name ?>
</p>

<p>
    <?= image($prize->sponsor_image_url) ?></p>
</p>
