<?php

include 'init.php';

$params = [
  "id" => null,
  "name" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_heroes_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

<div id="heroes-page">
  <div class="wrapper">
    <img src="<?= $data->header_url ?>">
    <div><?= $data->description ?></div>
  </div>
</div>

<?php }

include 'layout.php';
