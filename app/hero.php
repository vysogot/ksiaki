<?php

include 'init.php';

$params = [
  "slug" => null
];

$params = array_merge($params, $_GET);

$data['hero'] = execute('call sp_heroes_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_STR)
));

$data['boxes'] = execute('call sp_boxes_all();', [], true);

function content($params, $data) { ?>

<div id="heroes-page">
  <div class="wrapper">
    <div class="center"><img src="<?= $data['hero']->header_url ?>"></div>

    <?php include './partials/stroer_sky.html' ?>

    <div class="row hero">
        <h2><?= e($data['hero']->name) ?></h2>

        <div class="column-13">
            <?= image($data['hero']->cover_url) ?>
        </div>
        <div class="column-23"><?= $data['hero']->description ?>
            <div class="center" style="margin-top: 30px;">
                <?= image($data['hero']->gadget_url) ?>
            </div>
        </div>
    </div>
    <div class="row hero">
        <h3><?= t('tv_spot') ?></h3>
        <div class="column-33">
            <video controls muted preload="none" src="<?= $data['hero']->video_url ?>" poster="/uploads/movie-1.jpg"></video>
        </div>
    </div>
    <div class="row hero">
        <h3><?= t('in_current_edition') ?></h3>
        <div class="column-33">
    <section id="box-banners">
      <div id="box-banners-slider" class="boxes">
        <?php foreach($data['boxes'] as $box) { ?>
          <div>
            <?= link_to(image($box->image_url), $box->link_url) ?>
            <p><?= link_to($box->name, "$box->link_url") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>
        </div>
    </div>
    <div class="row hero">
        <h3><?= t('to_download') ?></h3>
        <div class="column-33">
    <section id="box-banners-2">
      <div id="box-banners-slider" class="boxes">
        <?php foreach($data['boxes'] as $box) { ?>
          <div>
            <?= link_to(image($box->image_url), $box->link_url) ?>
            <p><?= link_to($box->name, "$box->link_url") ?></p>
          </div>
        <?php } ?>
      </div>
    </section>
        </div>
    </div>
  </div>
</div>

    <script>

        $("#contests-slider, #movies-slider, #box-banners-slider").slick({
            variableWidth: true,
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 3,
            lazyLoad: 'ondemand'
        })
            .on('mouseenter', '.slick-slide', function (e) {
                $(e.currentTarget).addClass('expanded-light');
            })
            .on('mouseleave', '.slick-slide', function(e) {
                $(e.currentTarget).removeClass('expanded-light');
            });
    </script>

<?php }

include 'layout.php';
