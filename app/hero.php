<?php

include 'init.php';

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

    <?php if (!empty($data['hero']->header_url)) { ?>
        <div class="center hero-header">
            <?= image($data['hero']->header_url) ?>
        </div>
    <?php } ?>

    <?php include './partials/stroer_sky.html' ?>

    <div class="row hero">
        <h2>
            <?= e($data['hero']->name) ?>
            <?php if (is_admin()) { ?>
                <?= link_to(t('edit_form'), '/admin/heroes') ?>
            <?php } ?>
        </h2>

        <?php if (!empty($data['hero']->cover_url)) { ?>

            <div class="column-13 hero-cover">
                <?php if (!empty($data['hero']->cover_url)) { ?>
                    <?= link_to(image(thumbnail_name($data['hero']->cover_url)), $data['hero']->cover_url, ['class' => 'modal-image']) ?>
                <?php } ?>
            </div>

        <?php } ?>

        <?php if (!empty($data['hero']->gadget_url)) { ?>

            <div class="column-23">
                <p><?= $data['hero']->description ?></p>
                <div class="center hero-gadget">
                    <?= link_to(image(thumbnail_name($data['hero']->gadget_url)), $data['hero']->gadget_url, ['class' => 'modal-image']) ?>
                </div>
            </div>

        <?php } ?>

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
                      <?= link_to(image(thumbnail_name($box->file_url)), $box->file_url, ['class' => 'modal-image']) ?>
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
                        <?= link_to(image(thumbnail_name($box->file_url)), $box->file_url, ['class' => 'modal-image']) ?>
                        <p><?= link_to($box->name, "$box->file_url", ['class' => 'modal-image']) ?></p>
                      </div>
                    <?php } ?>
                  </div>
                </section>
            </div>
        </div>

    <?php } ?>

        <?php if (!empty($data['hero']->footer_url)) { ?>
            <div class="row">
                <div class="column-33">
                    <section class="hero-footer">
                      <?= image($data['hero']->footer_url) ?>
                      <p><?= $data['hero']->license_description ?></p>
                    </section>
                </div>
            </div>
        <?php } ?>

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
