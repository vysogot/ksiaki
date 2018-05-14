<?php

include 'init.php';

$params = [
    "id" => null,
    "offset" => 0,
    "limit" => 50
];

$params = array_merge($params, $_GET);

$data['user_movie'] = execute('call sp_user_movies_find(:p_id);', array(
    array('p_id', $params['id'], PDO::PARAM_INT)
));

$data['other_movies'] = execute('call sp_user_movies_sorted_by_likes(
  :p_offset,
  :p_limit
);', array(
  array('p_offset', $params['offset'], PDO::PARAM_INT),
  array('p_limit', $params['limit'], PDO::PARAM_INT)
), true);



function content($params, $data) { ?>

<div class="wrapper">
    <h1 class="hidden"><?= t('user_movies') ?></h1>

    <section id="main-user-movie">
        <?php if (!empty($data['user_movie'])) { ?>
            <div class="left">
                <video autoplay controls src=<?= $data['user_movie']->video_url ?> poster=<?= $data['user_movie']->image_url ?>></video>
            </div>
            <div class="left">
                <h3><?= $data['user_movie']->name ?></h3>
                <h4><?= $data['user_movie']->description ?></h4>
                <h5><?= t('likes') ?>: <span id="likes-number"><?= $data['user_movie']->likes_count ?></span></h5>
                <p id="like-button-container"></p>
                <script>
                var user_movie_id = <?= $data['user_movie']->id ?>; 

                $.ajax({
                    url: '/check_like.php?user_movie_id=' + user_movie_id
                }).done(function(result) {
                    var container = $("#like-button-container");
                    var like_link = '<?= link_to(t('like'), '/like.php?user_movie_id=' . $data['user_movie']->id, ['class' => 'like']) ?>';
                    var unlike_link = '<?= link_to(t('unlike'), '/unlike.php?user_movie_id=' . $data['user_movie']->id, ['class' => 'unlike']) ?>';

                    if (result['data'][0] == 0) {
                        container.html(like_link);
                    } else {
                        container.html(unlike_link);
                    }

                    var likesNumber = parseInt($('#likes-number').text());

                    $('.like').on('click', function() {

                        event.preventDefault();

                        $.ajax({
                            url: this.href
                        }).done(function() {
                            $('#likes-number').text(likesNumber + 1);
                            container.html('<?= t('like_done') ?>');
                        });
                    });

                    $('.unlike').on('click', function() {
                        event.preventDefault();

                        $.ajax({
                            url: this.href
                        }).done(function() {
                            $('#likes-number').text(likesNumber - 1);
                            container.html('<?= t('unlike_done') ?>');
                        });
                    });    
                });
                </script>
            </div>
        <?php } ?>
    </section>
    
    <section id="movies">
        <h2><?= t('user_movies') ?></h2>
        <div>
          <?php foreach($data['other_movies'] as $user_movie) { ?>
            <div class="left box">
              <?= link_to(image($user_movie->image_url), '/user_movie.php?id=' . $user_movie->id) ?>
              <p><?= link_to($user_movie->name, '/user_movie.php?id=' . $user_movie->id) ?></p>
            </div>
          <?php } ?> 
        </div>
    </section>
    
</div>

<?php }

include 'layout.php';
