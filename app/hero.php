<?php

include 'init.php';

$params = [
  "slug" => null,
  "offset" => 0,
  "limit" => 50
];

$params = array_merge($params, $_GET);

$data['hero'] = execute('call sp_heroes_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_STR)
));

function content($params, $data) { ?>

<div id="heroes-page">
  <div class="wrapper">
    <div class="center"><img src="<?= $data['hero']->header_url ?>"></div>

    <aside>
        <div class="sky-banner">
            <img class="ad" src="/uploads/sky-ad-3-narrow.jpg">
        </div>
    </aside>

    <div class="row hero">
    <h2><?= e($data['hero']->name) ?></h2>
        <div class="column-13"><?= image($data['hero']->cover_url) ?></div>
        <div class="column-23"><?= $data['hero']->description ?><div class="center" style="margin-top: 30px;"><?= image($data['hero']->gadget_url) ?></div></div>
        <div class="center"><video controls muted preload="none" src="<?= $data['hero']->video_url ?>" poster="/uploads/movie-1.jpg">
        </video></div>
    </div>
  </div>
</div>

<?php }

include 'layout.php';
