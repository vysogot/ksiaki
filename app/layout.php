<!doctype html>
<html>
<head>
    <title><?= t('title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <?php if (function_exists('meta')) meta(); ?>
    <?php $background = get_background(); ?>
    <style>
      html {
        background: white url('/assets/images/loading.gif') center 10% no-repeat;
      }

      body {
        visibility: hidden;
        background: <?= $background->background_color ?> url('<?= $background->image_url ?>') top no-repeat;
      }

      .slick-prev:before,
      .slick-next:before {
        color: <?= $background->details_color ?>!important;
      }

      nav, .ad, .rankings h2, .rankings ol,
      #banner, #slajder, #player,
      .box, #heroes .slick-slide,
      .boxes .slick-slide { box-shadow: 2px 2px 5px <?= $background->details_color ?>; }
    </style>
</head>
<body>
  <?= link_to('', $background->link_url, ['class' => 'background-link', 'target' => '_blank']) ?>
  <header>
    <div class="wrapper">

      <div id="logo">
        <a href="/"><img src="/assets/images/logo.png" /></a>
      </div>

      <div id="banner" class="slider">
        <div><img src="/uploads/banner-1.png" /></div>
        <div><img src="/uploads/banner-2.png" /></div>
      </div>

      <nav>
        <ul class="bare">
            <li>
                <?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?>
            </li>
            <li>
              <?= link_to(t('contests'), '/contests.php', ['id' => 'menu-contests']) ?>
            </li>
            <li>
              <?= link_to(t('downloads'), '/downloads.php', ['id' => 'menu-downloads']) ?>
            </li>
              <?php if (current_user()) { ?>
                <li class="right">
                  <?= link_to(t('logout'), '/logout.php', ['id' => 'menu-logout']) ?>
                </li>
                <li class="right">
                  <?= link_to(t('dashboard'), '/dashboard.php', ['id' => 'menu-login']) ?>
                </li>
                <?php if (is_admin()) { ?>
                  <li class="right">
                    <?= link_to(t('admin_panel'), '/admin/contests.php', ['id' => 'menu-admin']) ?>
                  </li>
                <?php } ?>
              <?php } else { ?>
                <li class="right">
                  <?= link_to(t('login'), '/login.php', ['id' => 'menu-login']) ?>
                </li>
              <?php } ?>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <main>
      <?php require 'partials/flashes.php'; ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
      <div class="wrapper-full">
        <section id="static-sites">
          <div class="wrapper">
            <ul class="bare left">
              <li><?= link_to(t('about_us'), '#') ?></li>
              <li><?= link_to(t('parents_info'), '#') ?></li>
              <li><?= link_to(t('statute'), '#') ?></li>
              <li><?= link_to(t('privacy_policy'), '#') ?></li>
              <li><?= link_to(t('faq'), '#') ?></li>
              <li><?= link_to(t('contact'), '#') ?></li>
            </ul>
          </div>
        </section>

        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>

    <link rel="stylesheet" type="text/css" href="/assets/css/slick.css?v=<?= filemtime(realpath(__DIR__ . '/assets/css/slick.css')) ?>" />
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css?v=<?= filemtime(realpath(__DIR__ . 'assets/css/style.css')) ?>" />

    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/slick.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/assets/js/sliders.js?v=<?= filemtime(realpath(__DIR__ . '/assets/js/sliders.js')) ?>" type="text/javascript" charset="utf-8"></script>
    <script src="/assets/js/app.js?v=<?= filemtime(realpath(__DIR__ . '/assets/js/app.js')) ?>" type="text/javascript" charset="utf-8"></script>
    <?php if (function_exists('before_body_close')) before_body_close(); ?>

    <noscript>
      <style>
        body{ visibility: visible; }
        header, main, footer { display: none; }
      </style>

      <h1><?= t('turn_on_javascript') ?></h1>
    </noscript>
    <script>$(document).on('ready', function() { $(document.body).css('visibility', 'visible'); });</script>
  </body>
  </html>
