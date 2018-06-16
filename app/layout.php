<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= t('website_title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--<script src="/assets/js/min.js" type="text/javascript"></script>-->

    <?php if (function_exists('meta')) meta(); ?>
    <?php $background = get_background(); ?>

    <!--<link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/style.css?v=<?php echo filemtime("assets/css/style.css")?>" />

    <style>
      html { background: white url('/assets/images/loading.gif') center 10% no-repeat; }
      body { visibility: hidden; background: <?= $background->background_color ?> url('<?= cdn_url($background->image_url) ?>') top no-repeat; background-attachment: fixed;}
      .slick-prev:before, .slick-next:before { color: <?= $background->details_color ?>!important; }
      nav, .ad, .rankings h2, .rankings ul, #banner, #slajder, #player, .box, #heroes .slick-slide, .boxes .slick-slide { box-shadow: 2px 2px 5px <?= $background->details_color ?>; }
      main { display: block;}
      .modal {padding-top: 10px !important;}
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
  <script>
      $('.modal .close').click(function() {
        $('.modal').hide();
      });
  </script>
  <div id="modal-ranking"></div>
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

      $('a.modal-image').on('click', function(event) {
        event.preventDefault();
        vex.dialog.alert({
            unsafeMessage: '<div class="center shrink"><img src="' + $(this).attr('href') + '"/></div>'
        })
      });

      $('a.modal-remote').on('click', function(event) {
        event.preventDefault();

        var href = $(this).attr('href');
        var className = $(this).data('modal-class');

        $.get(href, function(response) {
            vex.open({
                unsafeContent: response,
                contentClassName: className
            })
        })
      });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/js/vex.combined.min.js"></script>
	<script>vex.defaultOptions.className = 'vex-theme-flat-attack'</script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex-theme-flat-attack.min.css" />

    <style>
    .vex.vex-theme-os { padding-top: 50px; padding-bottom: 50px; }
    .vex.vex-theme-os .vex-content { width: unset; max-width: 80%; }
    .vex.vex-theme-os .vex-content p { margin-bottom: 30px; }
    </style>

  </body>
  </html>
<?php

$content = ob_get_clean();
echo $content;
