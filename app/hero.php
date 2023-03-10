<?php

include 'init.php';

$params = array_merge($params, $_GET);

$data['hero'] = execute('call sp_heroes_find_by_slug(:p_slug);', array(
  array('p_slug', $params['slug'], PDO::PARAM_STR)
));

if (empty($data['hero'])) redirect('/404.php');

$params['title'] = $data['hero']->name;

$data['hero_editions'] = fetch_all('call sp_hero_editions_find_by_hero_id(:p_hero_id);', array(
  array('p_hero_id', $data['hero']->id, PDO::PARAM_STR)
));

function content($params, $data) { ?>

<div id="heroes-page">
  <div class="wrapper">

    <?php if (!empty($data['hero']->header_url)) { ?>
        <div class="center hero-header">
            <?= image($data['hero']->header_url) ?>
        </div>
    <?php } ?>

    <aside class="sky-banner">
        <?php include './partials/stroer_sky.html' ?>
        <?php include './partials/konkursiak_of_the_month.php' ?>
    </aside>

    <?php foreach($data['hero_editions'] as $hero_edition) { ?>

        <?php

        $hero_magazines = fetch_all('call sp_hero_magazines_by_hero_edition_id(:p_hero_edition_id);', array(
          array('p_hero_edition_id', $hero_edition->id, PDO::PARAM_INT)
        ));

        $hero_wallpapers = fetch_all('call sp_hero_wallpapers_by_hero_edition_id(:p_hero_edition_id);', array(
          array('p_hero_edition_id', $hero_edition->id, PDO::PARAM_INT)
        ));

        ?>

        <div class="row hero">
            <h2>
                <?= e($hero_edition->name) ?>
                <?php if (is_admin()) { ?>
                    <?= link_to(t('edit_form'), '/admin/hero_editions') ?>
                <?php } ?>
            </h2>

            <?php if (!empty($hero_edition->cover_url)) { ?>

                <div class="column-13 hero-cover">
                    <?php if (!empty($hero_edition->cover_url)) { ?>
                        <?= link_to(image(thumbnail_name(secure_url($hero_edition->cover_url))), secure_url($hero_edition->cover_url), ['class' => 'modal-image']) ?>
                    <?php } ?>
                </div>

            <?php } ?>



                <div class="column-23">
                    <p><?= $hero_edition->description ?></p>
                    <?php if (!empty($hero_edition->gadget_url)) { ?>
                        <div class="center hero-gadget">
                            <?= link_to(image(thumbnail_name(secure_url($hero_edition->gadget_url))), secure_url($hero_edition->gadget_url), ['class' => 'modal-image']) ?>
                        </div>
                    <?php } ?>
                </div>



        </div>

        <?php if (!empty($hero_edition->video_url)) { ?>
            <div class="row hero">
                <h3><?= t('tv_spot') ?></h3>
                <div class="column-33">
                    <video controls muted preload="none" src="<?= secure_url($hero_edition->video_url) ?>"
                        poster="<?= secure_url($hero_edition->video_cover_url) ?>"></video>
                </div>
            </div>
        <?php } ?>

        <?php if (!empty($hero_magazines)) { ?>
        <div class="row hero">
            <h3><?= t('in_current_edition') ?></h3>
            <div class="column-33">
                <section>
                  <div class="box-slider" data-per-page="3">
                    <?php foreach($hero_magazines as $box) { ?>
                      <div class="box">
                          <?= link_to(image(thumbnail_name(secure_url($box->file_url))), secure_url($box->file_url), ['class' => 'modal-image']) ?>
                          <p><?= link_to($box->name, secure_url($box->file_url), ['class' => 'modal-image']) ?></p>
                      </div>
                    <?php } ?>
                  </div>
                </section>
            </div>
        </div>
        <?php } ?>

        <?php if (!empty($hero_wallpapers)) { ?>

            <div class="row hero">
                <h3><?= t('to_download') ?></h3>
                <div class="column-33">
                    <section>
                      <div class="box-slider" data-per-page="3">
                        <?php foreach($hero_wallpapers as $box) { ?>
                          <div class="box">
                            <?= link_to(image(thumbnail_name($box->file_url)), t('download_slug', ['id' => $box->id])) ?>
                            <p><?= link_to($box->name, t('download_slug', ['id' => $box->id])) ?></p>
                          </div>
                        <?php } ?>
                      </div>
                    </section>
                </div>
            </div>

        <?php } ?>

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

        <?php if($data['hero']->slug == 'turned-off') { ?>
            <?= link_to('', '/assets/images/20lat-big-v2.png', ['class' => 'modal-image', 'id' => 'popup']) ?>

            <script type="text/javascript">
                $(document).on('ready', function() {
                    $('a#popup').trigger('click');
                });
            </script>

        <?php } ?>

  </div>
</div>

<?php }

include 'layout.php';
