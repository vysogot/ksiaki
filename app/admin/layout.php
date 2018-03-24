<!doctype html>
<html>
<head>
    <title><?= t('title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
</head>
<body>
  <header>
    <div class="wrapper">
      <nav>
        <ul class="bare left">
          <li><?= link_to(t('home_page'), '/') ?></li>
          <li><?= link_to(t('users'), '/admin/users.php') ?></li>
          <li><?= link_to(t('contests'), '/admin/contests.php') ?></li>
          <li><?= link_to(t('heroes'), '/admin/heroes.php') ?></li>
          <li><?= link_to(t('backgrounds'), '/admin/backgrounds.php') ?></li>
          <li><?= link_to(t('rankings'), '/admin/rankings.php') ?></li>
          <li><?= link_to(t('downloads'), '/admin/downloads.php') ?></li>
          <li><?= link_to(t('logout'), '/logout.php') ?></li>
          </ul>
        </nav>
    </div>
    </header>
    <main>
      <?php require realpath(__DIR__ . '/../partials/flashes.php'); ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
      <div class="wrapper-full">
        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>
    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/app.js" type="text/javascript" charset="utf-8"></script>
  </body>
  </html>
