<?php

$heroes = execute('call sp_heroes_all();', [], true);

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

<script type="text/javascript">
$(document).on('ready', function() {
  $("#heroes-slider").slick({
    dots: false,
    infinite: true,
    centerMode: true,
    slidesToShow: 5,
    slidesToScroll: 5,
    variableWidth: true,
    lazyLoad: 'ondemand'
  })
  .on('mouseenter', '.slick-slide', function (e) {
    $(e.currentTarget).addClass('expanded');
  })
  .on('mouseleave', '.slick-slide', function(e) {
    $(e.currentTarget).removeClass('expanded');
  });
});
</script>
