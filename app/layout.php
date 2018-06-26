<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= website_title($params) ?></title>
    <meta name="description" content="<?= t('website_description') ?>" />
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

    <!--<link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/assets/css/style.css?v=<?php echo filemtime("assets/css/style.css")?>" />


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
        body { background: url(/assets/images/bg-pattern-orange.png) left top repeat; }
    <?php } ?>
    </style>

    <style>
      body { visibility: hidden; }
      main { display: block;}
      .modal {padding-top: 10px !important;}
    </style>

    <?php if (is_production_env()) { ?>

        <?php include 'partials/rollbar_client.html'; ?>
        <?php include 'partials/stroer_client.html'; ?>

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

      <div id='stroer_topbanner'>
      </div>

      <nav>
        <ul class="bare">
            <li><?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?></li>
            <li><?= link_to(t('contests'), t('contests_slug'), ['id' => 'menu-contests']) ?></li>
              <?php if (is_logged_in()) { ?>
                <li class="right"><?= link_to(t('logout'), '/logout.php', ['id' => 'menu-logout']) ?></li>
                <li class="right"><?= link_to(t('dashboard'), '/profile.php', ['id' => 'menu-login', 'class' => 'modal-remote']) ?></li>
                <?php if (is_admin()) { ?>
                  <li class="right"><?= link_to(t('admin_panel'), '/admin', ['id' => 'menu-admin']) ?></li>
                <?php } ?>
              <?php } else { ?>
                <li class="right"><?= link_to(t('log_in'), '/login.php', ['id' => 'menu-login']) ?></li>
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
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/js/vex.combined.min.js"></script>
	<script>vex.defaultOptions.className = 'vex-theme-flat-attack'</script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex-theme-flat-attack.min.css" />

    <style>
    .vex.vex-theme-flat-attack { padding-top: 50px; }
    .vex.vex-theme-flat-attack .vex-content .wrapper { width: 100%; }
    .vex.vex-theme-flat-attack .vex-content p { margin: 40px 0 0 0; }
    .vex.vex-theme-flat-attack .vex-content.wide-text { width: 80%; font-size: 80%; }
    .vex.vex-theme-flat-attack .vex-content.wide { width: fit-content; max-width: 80%; }
    </style>

    <?php if (current_url() == '/') { ?>
        <?php include 'partials/rodo.html'; ?>
    <?php } ?>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/cookie-bar/cookiebar-latest.min.js?forceLang=pl&theme=white&privacyPage=https%3A%2F%2Fkonkursiaki.pl%2Fpolityka-prywatnosci"></script>
    <style>
        #cookie-bar p { padding: 30px; font-size: 110%; }
        #cookie-bar-button { padding: 10px; margin-top: 25px; }
    </style>

  </body>
  </html>
<?php

$content = ob_get_clean();
echo $content;
