<!doctype html>
<html>
<head>
    <title><?= t('title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <?php if (function_exists('meta')) meta(); ?>
    <style>
      html { background-color: #eee; margin: 0; }
      nav { box-shadow: 2px 2px 5px #666; }
    </style>
</head>
<body>
  <header>
    <div class="wrapper-full">
      <nav>
        <ul class="bare">
          <li><?= link_to(t('home_page'), '/', ['id' => 'menu-back']) ?></li>
          <li><?= link_to(t('users'), '/admin/users.php', ['id' => 'menu-users']) ?></li>
          <li><?= link_to(t('contests'), '/admin/contests.php', ['id' => 'menu-contests']) ?></li>
          <li><?= link_to(t('heroes'), '/admin/heroes.php', ['id' => 'menu-heroes']) ?></li>
          <li><?= link_to(t('backgrounds'), '/admin/backgrounds.php', ['id' => 'menu-backgrounds']) ?></li>
          <li><?= link_to(t('rankings'), '/admin/rankings.php', ['id' => 'menu-rankings']) ?></li>
          <li><?= link_to(t('downloads'), '/admin/downloads.php', ['id' => 'menu-downloads']) ?></li>
          <li class="right"><?= link_to(t('logout'), '/logout.php', ['id' => 'menu-logout']) ?></li>
          </ul>
        </nav>
      </div>
    </header>
    <main>
      <?php require realpath(__DIR__ . '/../partials/flashes.php'); ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>

    <link rel="stylesheet" type="text/css" href="/assets/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css" />

    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/app.js" type="text/javascript" charset="utf-8"></script>
    <?php if (function_exists('before_body_close')) before_body_close(); ?>

  </body>
</html>
