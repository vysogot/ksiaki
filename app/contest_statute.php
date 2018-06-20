<?php

include 'init.php';

$contest = execute('call sp_contests_find_by_slug(:p_slug);', array(
  array('p_slug', $_GET['slug'], PDO::PARAM_STR)
));

?>

<?= $contest->statute ?>
