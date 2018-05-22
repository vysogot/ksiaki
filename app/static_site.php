<?php

include 'init.php';

$params = [
    "slug" => null,
    "offset" => 0,
    "limit" => 50
];

$params = array_merge($params, $_GET);

$data['static_site'] = execute('call sp_static_sites_find_by_slug(:p_slug);', array(
    array('p_slug', $params['slug'], PDO::PARAM_STR)
));

function content($params, $data) { ?>

<div class="wrapper static-site">
    <h1 class="hidden"><?= $data['static_site']->title ?></h1>

    <p><?= $data['static_site']->content ?></p> 
</div>

<?php }

include 'layout.php';
