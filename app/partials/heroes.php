<?php

$heroes = fetch_all('call sp_heroes_all();');

?>

<div class="wrapper">
  <div class="wrapper">
  <section id="heroes">
    <div id="heroes-slider">
      <?php foreach($heroes as $hero) { ?>
        <li>
          <div>
            <?= link_to(image($hero->avatar_url, ['title' => $hero->name]), t('hero_slug', ['slug' => $hero->slug])) ?>
          </div>
        </li>
      <?php } ?>
    </div>
  </section>
  </div>
</div>
