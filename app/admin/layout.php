<?php ob_start(); ?>
<!doctype html>
<html>
<head>
    <title><?= t('title') ?></title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.11/css/all.css" integrity="sha384-p2jx59pefphTFIpeqCcISO9MdVfIm4pNnsL08A6v5vaQc4owkQqxMV8kg4Yvhaw/" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link rel="icon" href="data:;base64,=">
    <?php if (function_exists('meta')) meta(); ?>
    <style>
      html { background-color: #eee; margin: 0; }
      nav { box-shadow: 2px 2px 5px #666; }
      .fas {padding-left: 10px;color:#979797;font-size: 2em;}
      .fa-times {color:red;}
      .fa-check {color:blue;}
      .none {display:none;}
      .table-vcenter td { vertical-align: middle!important;}
      .wrapper h4 {margin-top: 15px;}
      .modal-hero {width: 70%;}
      #is_active_check {margin: 13px 0 0;}
    </style>
</head>
<body>
  <header>
    <div class="wrapper-full">
      <nav>
        <ul class="bare">
          <li><?= link_to(t('home_page'), '/', ['id' => 'menu-back']) ?></li>
          <li><?= link_to(t('users'), '/admin/users/', ['id' => 'menu-users']) ?></li>
          <li><?= link_to(t('contests'), '/admin/contests/', ['id' => 'menu-contests']) ?></li>
          <li><?= link_to(t('heroes'), '/admin/heroes/', ['id' => 'menu-heroes']) ?></li>
          <li><?= link_to(t('backgrounds'), '/admin/backgrounds/', ['id' => 'menu-backgrounds']) ?></li>
          <li><?= link_to(t('slides'), '/admin/slides/', ['id' => 'menu-slides']) ?></li>
          <li><?= link_to(t('video_ads'), '/admin/video_ads/', ['id' => 'menu-video-ads']) ?></li>
          <li><?= link_to(t('boxes'), '/admin/boxes/', ['id' => 'menu-boxes']) ?></li>
          <li><?= link_to(t('user_movies'), '/admin/user_movies/', ['id' => 'menu-user-movies']) ?></li>
          <li><?= link_to(t('static_sites'), '/admin/static_sites/', ['id' => 'menu-static-sites']) ?></li>
          <li class="right"><?= link_to(t('logout'), '/logout/', ['id' => 'menu-logout']) ?></li>
          </ul>
        </nav>
      </div>
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

  </body>
</html>
<?php

$content = ob_get_clean();
echo $content;
