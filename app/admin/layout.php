<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= t('website_title') ?></title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/png" />

    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.11/css/all.css" integrity="sha384-p2jx59pefphTFIpeqCcISO9MdVfIm4pNnsL08A6v5vaQc4owkQqxMV8kg4Yvhaw/" crossorigin="anonymous">
    <!--<link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

    <link rel="stylesheet" href="/assets/css/suneditor.css">
    <link rel="stylesheet" href="/assets/js/css/suneditor-contents.css">

    <script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="//cdn.jsdelivr.net/npm/mark.js@8.11.1/dist/jquery.mark.js"></script>
    <script src="//cdn.datatables.net/plug-ins/1.10.16/features/mark.js/datatables.mark.min.js"></script>

    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="/assets/js/suneditor.js"></script>
    <script src="/assets/lang/pl.js"></script>

    <link rel="icon" href="data:;base64,=">
    <?php if (function_exists('meta')) meta(); ?>
    <style>
      html { background-color: #eee; margin: 0; }
      header {min-height: 125px !important;}
      nav    { opacity: 1!important; margin:0!important;}
      nav ul { margin-top: 25px!important; margin-left: 25px!important; }
      nav a {background: transparent !important;}
      nav a:hover, .active {filter: invert(100%); -webkit-filter: none!important; }
      .navbar {padding-left: 10px;padding-right: 10px;min-height: 32px !important;z-index: 1!important;}
      .navbar-brand {height: 100% !important;}
      .navbar-fixed-top .navbar-brand {padding: 15px 0;}
      .navbar-fixed-top .nav {padding-left: 15px;padding-top: 25px;}
      .nav>li>a {padding: 20px 5px !important;}
      .panel-body {padding-bottom: 0px;}
      .fas {padding-left: 10px;color:#979797;font-size: 2em;}
      .fa-times {color:red;}
      .fa-check {color:blue;}
      .none {display:none;}
      .dataTables_wrapper .dataTables_length {padding-left: 10px;}
      #dataTable .active { text-align: center; }
      #dataTable .links { white-space: nowrap; text-align: center; }
      #dataTable .links a { margin-right: 15px; }
      .table-vcenter td { vertical-align: middle !important;}
      .wrapper { z-index: unset!important; }
      .wrapper h4 {margin-top: 15px;}
      .modal {padding-top: 10px !important;}
      .modal-dialog {width: 70%;}
      #is_active_check {margin: 13px 0 0;}
      input.error { background: #FDD; }
      textarea { margin: auto; width: 100%; height: 10em; }
      mark {background: orange;color: black;}
      a[disabled="disabled"] {pointer-events: none;}
      a[disabled="disabled"] > .fas {opacity: 0.5;}
      .table-striped tbody tr.data-table-row-warning { background-color: #FF0; }
    </style>

    <?php if (is_production_env()) { ?>

        <?php include realpath(__DIR__ . '/../partials/rollbar_client.html'); ?>

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

    <?php if (function_exists('before_body_close')) before_body_close(); ?>

    <script type="text/javascript">

      $(document).ready(function() {
        $('.confirmation').on('click', function () {
            return confirm('<?= t('are_you_sure') ?>');
        });

        $( document ).tooltip();

      });

    </script>

    <script>

    $('a.remote').click(function(event) {
        event.preventDefault();

        $('main').load($(this).attr('href'));
        window.history.pushState($(this).attr('href'), $(this).attr('href'), $(this).attr('href'));
    });

    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/js/vex.combined.min.js"></script>
	  <script>
      vex.defaultOptions.className = 'vex-theme-flat-attack';
      vex.defaultOptions.closeAllOnPopState = false;
    </script>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex.min.css" />
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vex-js/4.1.0/css/vex-theme-flat-attack.min.css" />

    <style>
    .vex.vex-theme-flat-attack .vex-content .wrapper { width: 100%; }
    </style>

  </body>
</html>
<?php

$content = ob_get_clean();
echo $content;
