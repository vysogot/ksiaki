<section id="movies">
      <h2><?= t('user_movies') ?></h2>
      <div id="movies-slider" class="boxes">
        <?php foreach($data['user_movies'] as $user_movie) { ?>
          <div>
              <?= link_to(image($user_movie->image_url), '/user_movie.php?id=' . $user_movie->id) ?>
              <p><?= link_to($user_movie->name, '/user_movie.php?id=' . $user_movie->id) ?></p>
          </div>
        <?php } ?> 
     </div>
</section>



