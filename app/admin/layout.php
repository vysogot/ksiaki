<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= t('website_title') ?></title>

    <script>
      var appEnv = '<?= $GLOBALS['env'] ?>';
    </script>

    <meta charset="utf-8">

    <link rel="icon" href="data:;base64,=">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <link rel="stylesheet" href="/assets/lib/fontawesome-v5.0.11.css">
    <link rel="stylesheet" href="/assets/lib/jquery-ui/jquery-ui-v1.12.1.css">
    <link rel="stylesheet" href="/assets/lib/bootstrap/bootstrap-v3.3.7.min.css">
    <link rel="stylesheet" href="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.css">
    <link rel="stylesheet" href="/assets/lib/suneditor/css/suneditor.css">
    <link rel="stylesheet" href="/assets/lib/suneditor/css/suneditor-contents.css">

    <link rel="stylesheet" href="/assets/css/admin.css?v=<?php echo filemtime(realpath(__DIR__ . '/../assets/css/admin.css')) ?>"">

    <script src="/assets/lib/jquery-v2.2.4.min.js"></script>
    <script src="/assets/lib/bootstrap/bootstrap-v3.3.7.min.js"></script>
    <script src="/assets/lib/markjs-v8.11.1.js"></script>
    <script src="/assets/lib/jquery-ui/jquery-ui-v1.12.1.js"></script>
    
    <script src="/assets/lib/datatables/jquery-dataTables-v1.10.16.min.js"></script>
    <script src="/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.js"></script>
    <script src="/assets/lib/datatables/markjs-dataTables-v1.10.16.min.js"></script>

    <script src="/assets/lib/suneditor/suneditor.js"></script>
    <script src="/assets/lib/suneditor/lang/pl.js"></script>

    <?php if (is_public_env()) { ?>
        <script src="/assets/lib/rollbar_client.js"></script>
    <?php } ?>
    
</head>
<body>
    <header>
      <nav class="navbar navbar-default center">
      <div class="navbar-header">
        <a class="navbar-brand" href="/">
          <img height=75 src="/assets/images/logo.png" alt="logo">
        </a>
      </div>
      <div>
        <ul class="nav navbar-nav">
          <li><?= link_to(t('users'), '/admin/users/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('contests'), '/admin/contests/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('heroes'), '/admin/heroes/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('backgrounds'), '/admin/backgrounds/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('boxes'), '/admin/boxes/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('slides'), '/admin/slides/', ['class' => 'remote']) ?></li>
          <li><?= link_to(t('video_ads'), '/admin/video_ads/', ['class' => 'remote']) ?></li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
              <?= t('admin_menu_other_items') ?>
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <!-- <li><?= link_to(t('user_movies'), '/admin/user_movies/', ['class' => 'remote']) ?></li> -->
              <li><?= link_to(t('hero_editions'), '/admin/hero_editions/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('hero_files'), '/admin/hero_files/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('contest_prizes'), '/admin/contest_prizes/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('sponsors'), '/admin/sponsors/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('static_sites'), '/admin/static_sites/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('mail_templates'), '/admin/mail_templates/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('log_mail'), '/admin/log_mail/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('score_games'), '/admin/score_games/', ['class' => 'remote']) ?></li>
              <li><?= link_to(t('back_to_home_page'), '/') ?></li>
            </ul>
          </li>
          <li class="right"><?= link_to(t('logout'), '/logout.php') ?></li>
          </ul>
        </div>
      </nav>
    </header>
    <main>
      <?php include realpath(__DIR__ . '/../partials/flashes.php'); ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
        <section id="copyright">
          <div class="wrapper">
            <h4><?= t('copyright') ?></h4>
          </div>
        </section>
    </footer>

    <link rel="stylesheet" type="text/css" href="/assets/css/style.css" />

    <script>

      $(document).ready(function() {
        $('.confirmation').on('click', function () {
            return confirm('<?= t('are_you_sure') ?>');
        });

        $( document ).tooltip();

      });

      $('a.remote').click(function(event) {
          event.preventDefault();

          $('main').load($(this).attr('href'));
          window.history.pushState($(this).attr('href'), $(this).attr('href'), $(this).attr('href'));
      });

    </script>



    <script src="/assets/lib/vex/vex.combined-v4.1.0.min.js"></script>
    <script>
      vex.defaultOptions.className = 'vex-theme-flat-attack';
      vex.defaultOptions.closeAllOnPopState = false;
    </script>
    <link rel="stylesheet" href="/assets/lib/vex/vex-v4.1.0.min.css" />
    <link rel="stylesheet" href="/assets/lib/vex/vex-theme-flat-attack-v4.1.0.min.css" />

    <style>
    .vex.vex-theme-flat-attack .vex-content .wrapper { width: 100%; }
    </style>

  </body>
</html>
<?php

$content = ob_get_clean();
echo $content;
