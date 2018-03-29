<?php

$heroes = execute('call sp_heroes_all(
  :p_id,
  :p_name,
  :p_offset,
  :p_limit
);', array(
  array('p_id', NULL, PDO::PARAM_INT),
  array('p_name', NULL, PDO::PARAM_STR),
  array('p_offset', 0, PDO::PARAM_INT),
  array('p_limit', 50, PDO::PARAM_INT)
), true);

?>

<div class="wrapper">
  <div class="wrapper">
  <section id="heroes">
    <div id="heroes-slider">
      <?php foreach($heroes as $hero) { ?>
        <li>
          <div>
            <?= link_to("<img src='$hero->avatar_url' title='$hero->name'>", "/heroes/show.php?id=$hero->id") ?>
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
