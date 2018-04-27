<?php

include '../init.php';

$params = [
    "id" => null,
    "offset" => 0,
    "limit" => 50
];

$params = array_merge($params, $_GET);

$data['user_movie'] = execute('call sp_user_movies_find(:p_id);', array(
    array('p_id', $params['id'], PDO::PARAM_INT)
));

$data['other_movies'] = execute('call sp_user_movies_all(
  :p_id,
  :p_name,
  :p_link_url,
  :p_offset,
  :p_limit
);', array(
  array('p_id', NULL, PDO::PARAM_INT),
  array('p_name', NULL, PDO::PARAM_STR),
  array('p_link_url', NULL, PDO::PARAM_STR),
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);



function content($params, $data) { ?>

<div class="wrapper">
    <h1 class="hidden"><?= t('user_movies') ?></h1>

    <section id="main-user-movie">
        <?php if (!empty($data['user_movie'])) { ?>
            <video autoplay src=<?= $data['user_movie']->video_url ?> poster=<?= $data['user_movie']->image_url ?>></video>
            <p><?= $data['user_movie']->name ?></p>
        <?php } ?>
    </section>
    
    <section id="movies">
        <h2><?= t('user_movies') ?></h2>
        <div>
          <?php foreach($data['other_movies'] as $user_movie) { ?>
            <div class="left box">
              <?= link_to(image($user_movie->image_url), '/user_movies/show.php?id=' . $user_movie->id) ?>
              <p><?= link_to($user_movie->name, '/user_movies/show.php?id=' . $user_movie->id) ?></p>
            </div>
          <?php } ?> 
        </div>
    </section>
    
</div>

<?php }

include '../layout.php';
