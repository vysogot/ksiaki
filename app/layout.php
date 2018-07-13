<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= website_title($params) ?></title>
    <meta name="description" content="<?= t('website_description') ?>" />

    <meta charset="utf-8">
    <?php if (function_exists('meta')) meta(); ?>

    <link rel="icon" href="data:;base64,=">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <link rel="stylesheet" href="/assets/lib/bootstrap/bootstrap-v3.3.7.min.css">
    <link rel="stylesheet" href="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.css">

    <link rel="stylesheet" href="/assets/css/style.css?v=<?php echo filemtime("assets/css/style.css")?>" />
    <link rel="stylesheet" href="/assets/lib/jquery-ui/jquery-ui-v1.12.1.css">

    <script src="/assets/lib/jquery-v2.2.4.min.js"></script>
    <script src="/assets/lib/bootstrap/bootstrap-v3.3.7.min.js"></script>

    <script src="/assets/lib/datatables/jquery-dataTables-v1.10.16.min.js"></script>
    <script src="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.js"></script>

    <script src="/assets/lib/slick-carousel-v1.8.1.min.js"></script>
    <script src="/assets/lib/isMobile.js"></script>

    <script src="/assets/lib/jquery-ui/jquery-ui-v1.12.1.js"></script>
    <script src="/assets/lib/jquery-ui/calendar-pl.js"></script>

    <?php $background = get_background($_SERVER['REQUEST_URI']); ?>

    <style>
    <?php if (!empty($background)) { ?>
        html { background: white url('/assets/images/loading.gif') center 10% no-repeat; }
        body { background: <?= $background->background_color ?> url('<?= cdn_url($background->image_url) ?>') center top no-repeat; background-attachment: fixed; margin-top: -5px; }
        .slick-prev:before, .slick-next:before { color: <?= $background->details_color ?>!important; }

        nav, .ad, .rankings h2, .rankings ul, #banner, #slajder,
        #player, .box, #heroes .slick-slide, .boxes .slick-slide,
        .sky-banner img, .shadow {
            box-shadow: 2px 2px 5px <?= $background->details_color ?>;
        }
    <?php } else { ?>
        body { background: linear-gradient(#c6f1ff, #e3e3e3); }
        nav, .ad, .rankings h2, .rankings ul, #banner, #slajder,
        #player, .box, #heroes .slick-slide, .boxes .slick-slide,
        .sky-banner img, .shadow {
            box-shadow: 2px 2px 5px #000;
        }
    <?php } ?>
    </style>

    <style>
      body { visibility: hidden; }
      main { display: block;}
      .modal {padding-top: 10px !important;}
    </style>

    <?php if (is_public_env()) { ?>

        <?php include 'partials/rollbar_client.php'; ?>
        <?php include 'partials/stroer_client.php'; ?>

    <?php } ?>

</head>
<body>
    <?php if (!empty($background)) { ?>
        <?= link_to('', $background->link_url, ['class' => 'background-link', 'target' => '_blank']) ?>
    <?php } ?>
  <div class="modal"><div class="modal-content"><a href="#" class="close">&times;</a><p></p></div></div>
  <script>
      $('.modal .close').click(function() {
        $('.modal').hide();
      });
  </script>
  <div id="modal-ranking"></div>
  <header>
    <div class="wrapper">

      <div id="logo"><?= link_to(image('/assets/images/logo.png'), '/') ?></div>

      <div id="stroer_topbanner_container">
        <div id='stroer_topbanner'>
        </div>
      </div>

      <nav>
        <ul class="bare">
            <li><?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?></li>
            <li><?= link_to(t('contests'), t('contests_slug'), ['id' => 'menu-contests']) ?></li>
              <?php if (is_logged_in()) { ?>
                <li class="right"><?= link_to(t('logout'), t('logout_slug'), ['id' => 'menu-logout']) ?></li>
                <li class="right"><?= link_to(t('dashboard'), t('your_account_slug'), ['id' => 'menu-login', 'class' => 'modal-remote']) ?></li>
                <?php if (is_admin()) { ?>
                  <li class="right"><?= link_to(t('admin_panel'), '/admin', ['id' => 'menu-admin']) ?></li>
                <?php } ?>
              <?php } else { ?>
                <li class="right"><?= link_to(t('log_in'), t('login_slug'), ['id' => 'menu-login']) ?></li>
              <?php } ?>
          </ul>
        </nav>
      </div>
    </header>

    <script src="/assets/lib/vex/vex.combined-v4.1.0.min.js"></script>
    <script>
      vex.defaultOptions.className = 'vex-theme-flat-attack'
    </script>
    <link rel="stylesheet" href="/assets/lib/vex/vex-v4.1.0.min.css" />
    <link rel="stylesheet" href="/assets/lib/vex/vex-theme-flat-attack-v4.1.0.min.css" />

    <style>
    .vex.vex-theme-flat-attack { padding-top: 50px; }
    .vex.vex-theme-flat-attack .vex-content .wrapper { width: 100%; }
    .vex.vex-theme-flat-attack .vex-content p { margin: 40px 0 0 0; }
    .vex.vex-theme-flat-attack .vex-content.wide-text { width: 80%; font-size: 80%; }
    .vex.vex-theme-flat-attack .vex-content.wide { width: fit-content; max-width: 80%; }
    .vex.vex-theme-flat-attack .vex-content.wide img { max-width: 100%; }
    </style>

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
        vex.open({
            unsafeContent: '<div class="center shrink"><img src="' + $(this).attr('href') + '"/></div>',
            contentClassName: 'wide',
            showCloseButton: false
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

      $('a.no-action').on('click', function(event) {
        event.preventDefault();
      });

      $('a.rodo').click(function(event) {
        event.preventDefault();

        $.get('/rodo', function(response) {
          vex.dialog.open({
              unsafeMessage: response,
              contentClassName: 'wide-text',
              overlayClosesOnClick: false,
              buttons: [
                  $.extend({}, vex.dialog.buttons.YES, { text: 'Rozumiem' }),
              ]
          });
        });
      });
    </script>

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

    <?php if (is_public_env()) { ?>

      <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-50691492-1', 'konkursiaki.pl');
      ga('send', 'pageview');
      </script>

    <?php } ?>

  </body>
  </html>

<?php

$content = ob_get_clean();
echo $content;
