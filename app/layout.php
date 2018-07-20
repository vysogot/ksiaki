<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= website_title($params) ?></title>
    <meta name="description" content="<?= t('website_description') ?>" />

    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <script>
      var appEnv = '<?= $GLOBALS['env'] ?>';
      var stroerPlace = '<?= is_homepage() ? 'home' : 'other' ?>';
    </script>

    <?php if (is_public_env()) { ?>

      <script src="/assets/js/app.min.js?v=<?php echo filemtime("assets/js/app.min.js")?>"></script>
      <link rel="stylesheet" href="/assets/css/style.min.css?v=<?php echo filemtime("assets/css/style.min.css")?>">

    <?php } else { ?>

      <link rel="stylesheet" href="/assets/lib/bootstrap/bootstrap-v3.3.7.min.css">
      <link rel="stylesheet" href="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.css">
      <link rel="stylesheet" href="/assets/lib/jquery-ui/jquery-ui-v1.12.1.css">
      <link rel="stylesheet" href="/assets/lib/vex/vex-v4.1.0.min.css">
      <link rel="stylesheet" href="/assets/lib/vex/vex-theme-flat-attack-v4.1.0.min.css">

      <link rel="stylesheet" href="/assets/css/style.css?v=<?php echo filemtime("assets/css/style.css")?>" />

      <script src="/assets/lib/jquery-v2.2.4.min.js"></script>
      <script src="/assets/lib/bootstrap/bootstrap-v3.3.7.min.js"></script>

      <script src="/assets/lib/datatables/jquery-dataTables-v1.10.16.min.js"></script>
      <script src="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.js"></script>

      <script src="/assets/lib/slick-carousel-v1.8.1.min.js"></script>
      <script src="/assets/lib/isMobile.js"></script>

      <script src="/assets/lib/jquery-ui/jquery-ui-v1.12.1.js"></script>
      <script src="/assets/lib/vex/vex.combined-v4.1.0.min.js"></script>
      <script src="/assets/js/app.js"></script>

    <?php } ?>

    <?php $background = get_background($_SERVER['REQUEST_URI']); ?>

    <style>
      <?php if (!empty($background)) { ?>
          html { background: white url('/assets/images/loading.gif') center 10% no-repeat; }
          body { background: <?= $background->background_color ?> url('<?= cdn_url($background->image_url) ?>') center top no-repeat; background-attachment: fixed; margin-top: -5px; }
          .slick-prev:before, .slick-next:before { color: <?= $background->details_color ?>!important; }

          nav, .ad, .rankings h2, .rankings ul, #slajder,
          #player, .box, #heroes .slick-slide, .boxes .slick-slide,
          .sky-banner img, .shadow {
              box-shadow: 2px 2px 5px <?= $background->details_color ?>;
          }
      <?php } else { ?>
          body { background: linear-gradient(#c6f1ff, #e3e3e3); }
          nav, .ad, .rankings h2, .rankings ul, #slajder,
          #player, .box, #heroes .slick-slide, .boxes .slick-slide,
          .sky-banner img, .shadow {
              box-shadow: 2px 2px 5px #000;
          }
      <?php } ?>

      body { visibility: hidden; }
      main { display: block;}
      .modal {padding-top: 10px !important;}
    </style>

</head>
<body>

    <?php if (!empty($background)) { ?>
        <?= link_to('', $background->link_url, ['class' => 'background-link', 'target' => '_blank']) ?>
    <?php } ?>

  <div class="modal">
    <div class="modal-content">
      <a href="#" class="close">&times;</a><p></p>
    </div>
  </div>

  <div id="modal-ranking"></div>
  <header>
    <div class="wrapper">

      <div id="logo"><?= link_to(image('/assets/images/logo.png'), '/') ?></div>

      <div id="stroer_topbanner_container">
        <div id='stroer_topbanner'></div>
      </div>

      <nav>
        <ul class="bare">
            <li><?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?></li>
            <li><?= link_to(t('contests'), t('contests_slug'), ['id' => 'menu-contests']) ?></li>
              <?php if (is_logged_in()) { ?>
                <li class="right"><?= link_to(t('logout'), t('logout_slug'), ['id' => 'menu-logout']) ?></li>
                <li class="right"><?= link_to(t('dashboard'), t('your_account_slug'), ['id' => 'menu-login', 'class' => 'modal-remote']) ?></li>
                <?php if (can_access_admin()) { ?>
                  <li class="right"><?= link_to(t('admin_panel'), '/admin', ['id' => 'menu-admin']) ?></li>
                <?php } ?>
              <?php } else { ?>
                <li class="right"><?= link_to(t('log_in'), t('login_slug'), ['id' => 'menu-login']) ?></li>
              <?php } ?>
          </ul>
        </nav>
      </div>
    </header>    

    <main>
      <?php include 'partials/heroes.php'; ?>
      <?php include 'partials/flashes.php'; ?>
      <?php content($params, $data); ?>
    </main>

    <footer>
      <div class="wrapper-full">
        <?php include 'partials/static_sites.php' ?>

        <section id="rodo">
          <div class="wrapper">
            <p><?= link_to(t('rodo'), '/rodo', ['class' => 'rodo']) ?></p>
          </div>
        </section>

        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>

    <noscript>
      <style>body{ visibility: visible; } header, main, footer { display: none; }</style>
      <h1><?= t('turn_on_javascript') ?></h1>
    </noscript>

    <?php if ((current_url() == '/') && !isset($_COOKIE['RODO'])) {
         setcookie('RODO', '1', time()+3600*24*7, "/", $GLOBALS['config']['domain'], true, true); ?>
      <script>$('a.rodo').trigger('click');</script>
    <?php } ?>

    <script id="cookieinfo"
      src="/assets/lib/cookieinfo.min.js"
      data-message="Ta strona używa ciasteczek (cookies), dzięki którym nasz serwis może działać lepiej."
      data-linkmsg="Dowiedz się więcej"
      data-moreinfo="//pl.wikipedia.org/wiki/HTTP_cookie"
      data-close-text="Rozumiem">
    </script>

  </body>
  </html>

<?php

$content = ob_get_clean();
echo $content;
