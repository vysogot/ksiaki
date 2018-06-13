<?php

include 'init.php';

$params = [
  "slug" => null
];

$params = array_merge($params, $_GET);

$data['hero'] = execute('call sp_heroes_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_STR)
));

if (empty($data['hero'])) redirect('/404.php');

$data['hero_magazines'] = execute('call sp_hero_magazines_by_hero_id(:p_hero_id);', array(
  array('p_hero_id', $data['hero']->id, PDO::PARAM_STR)
), true);

$data['hero_wallpapers'] = execute('call sp_hero_wallpapers_by_hero_id(:p_hero_id);', array(
  array('p_hero_id', $data['hero']->id, PDO::PARAM_STR)
), true);

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

    <?php if (!empty($data['hero']->video_url)) { ?>
        <div class="row hero">
            <h3><?= t('tv_spot') ?></h3>
            <div class="column-33">
                <video controls muted preload="none" src="<?= $data['hero']->video_url ?>"
                    poster="<?= $data['hero']->video_cover_url ?>"></video>
            </div>
        </div>
    <?php } ?>

    <?php if (!empty($data['hero_magazines'])) { ?>
    <div class="row hero">
        <h3><?= t('in_current_edition') ?></h3>
        <div class="column-33">
            <section>
              <div id="box-banners-slider" class="boxes">
                <?php foreach($data['hero_magazines'] as $box) { ?>
                  <div>
                      <?= link_to(image($box->file_url), $box->file_url, ['class' => 'modal-image']) ?>
                      <p><?= link_to($box->name, "$box->file_url", ['class' => 'modal-image']) ?></p>
                  </div>
                <?php } ?>
              </div>
            </section>
        </div>
    </div>
    <?php } ?>

    <?php if (!empty($data['hero_wallpapers'])) { ?>

        <div class="row hero">
            <h3><?= t('to_download') ?></h3>
            <div class="column-33">
                <section>
                  <div id="box-banners-slider" class="boxes">
                    <?php foreach($data['hero_wallpapers'] as $box) { ?>
                      <div>
                        <?= link_to(image($box->file_url), $box->file_url, ['class' => 'modal-image']) ?>
                        <p><?= link_to($box->name, "$box->file_url", ['class' => 'modal-image']) ?></p>
                      </div>
                    <?php } ?>
                  </div>
                </section>
            </div>
        </div>
      </div>
    </div>

    <?php } ?>

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

        $('a.modal-image').on('click', function(event) {
          event.preventDefault();

          $('.modal-content p').append('<div class="center"><img src="' + $(this).attr('href') + '"/></div>');
          $('.modal').show();
        });
    </script>

<?php }

include 'layout.php';
