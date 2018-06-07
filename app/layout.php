<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= t('website_title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <script src="/assets/js/min.js" type="text/javascript"></script>

    <?php if (function_exists('meta')) meta(); ?>
    <?php $background = get_background(); ?>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link rel="stylesheet" type="text/css" href="/assets/css/style.css?v=<?php echo filemtime("assets/css/style.css")?>" />

    <style>
      html { background: white url('/assets/images/loading.gif') center 10% no-repeat; }
      body { visibility: hidden; background: <?= $background->background_color ?> url('<?= $background->image_url ?>') top no-repeat; background-attachment: fixed;}
      .slick-prev:before, .slick-next:before { color: <?= $background->details_color ?>!important; }
      nav, .ad, .rankings h2, .rankings ul, #banner, #slajder, #player, .box, #heroes .slick-slide, .boxes .slick-slide { box-shadow: 2px 2px 5px <?= $background->details_color ?>; }
      main { display: block;}
    </style>

    <!-- Google Tag Manager -->
    <script>

      var dataLayer = [];

           dataLayer.push({"page": "home"});

      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','GTM-PWFPLTN');
    </script>
    <!-- End Google Tag Manager -->
</head>
<body>
  <?= link_to('', $background->link_url, ['class' => 'background-link', 'target' => '_blank']) ?>
  <div class="modal"><div class="modal-content"><a href="#" class="close">&times;</a><p></p></div></div>
  <header>
    <div class="wrapper">

      <div id="logo"><a href="/"><img src="/assets/images/logo.png" /></a></div>

      <div id='stroer_topbanner'>
      </div>

      <nav>
        <ul class="bare">
            <li><?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?></li>
            <li><?= link_to(t('contests'), '/contests.php', ['id' => 'menu-contests']) ?></li>
              <?php if (is_logged_in()) { ?>
                <li class="right"><?= link_to(t('logout'), '/logout.php', ['id' => 'menu-logout']) ?></li>
                <li class="right"><?= link_to(t('dashboard'), '/dashboard.php', ['id' => 'menu-login']) ?></li>
                <?php if (is_admin()) { ?>
                  <li class="right"><?= link_to(t('admin_panel'), '/admin', ['id' => 'menu-admin']) ?></li>
                <?php } ?>
              <?php } else { ?>
                <li class="right"><?= link_to(t('login'), '/login.php', ['id' => 'menu-login']) ?></li>
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

        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>

    <?php if (function_exists('before_body_close')) before_body_close(); ?>

    <noscript>
      <style>body{ visibility: visible; } header, main, footer { display: none; }</style>
      <h1><?= t('turn_on_javascript') ?></h1>
    </noscript>

    <script type="text/javascript">
    $(document).on('ready', function() {
      $("#banner").slick({
        dots: false,
        vertical: false,
        centerMode: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        infinite: true,
        arrows: false,
        lazyLoad: 'ondemand'
      });

   });
    </script>

    <script type="text/javascript">
      $(document).on('ready', function() { $
        (document.body).css('visibility', 'visible');
      });
    </script>

  </body>
  </html>
<?php

$content = ob_get_clean();
echo $content;
