<?php

include 'init.php';

$params = [
  "slug" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data = execute('call sp_heroes_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_STR)
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
