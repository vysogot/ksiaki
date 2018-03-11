<!doctype html>
<html>
<head>
    <title><?= t('title') ?></title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="/assets/css/style.css" />
    <?php if (function_exists('meta')) meta(); ?>
</head>
<body>
  <header>
    <div class="wrapper">

      <div id="logo">
        <a href="/"><img src="/assets/images/logo.png" /></a>
      </div>

      <div id="banner" class="slider">
        <div><img src="/assets/images/banner-1.png" /></div>
        <div><img src="/assets/images/banner-2.png" /></div>
      </div>
      <nav>
        <ul class="bare">
            <li>
                <?= link_to(t('home_page'), '/', ['id' => 'menu-home']) ?>
            </li>
            <li>
              <?= link_to(t('contests'), '/contests.php', ['id' => 'menu-contests']) ?>
            </li>
            <li>
              <?= link_to(t('downloads'), '/downloads.php', ['id' => 'menu-download']) ?>
            </li>
            <li class="right">
            <?php if (current_user()) { ?>
              <?= link_to(t('dashboard'), '/dashboard.php', ['id' => 'menu-login']) ?>
            <?php } else { ?>
              <?= link_to(t('login'), '/login.php', ['id' => 'menu-login']) ?>
            <?php } ?>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <main>
      <div class="wrapper">
        <?= !is_admin()?: link_to(t('admin_panel'), '/admin/contests.php'); ?>
      </div>
      <?php require 'partials/flashes.php'; ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
      <div class="wrapper-full">
        <section id="static-sites">
          <div class="wrapper">
            <ul class="bare left">
              <li><?= link_to(t('about_us'), '#') ?></li>
              <li><?= link_to(t('parents_info'), '#') ?></li>
              <li><?= link_to(t('statute'), '#') ?></li>
              <li><?= link_to(t('privacy_policy'), '#') ?></li>
              <li><?= link_to(t('faq'), '#') ?></li>
              <li><?= link_to(t('contact'), '#') ?></li>
            </ul>
          </div>
        </section>

        <section id="copyright">
          <div class="wrapper">
            <p><?= t('copyright') ?></p>
          </div>
        </section>
      </div>
    </footer>

    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/slick.js" type="text/javascript" charset="utf-8"></script>
    <script src="/assets/js/app.js" type="text/javascript" charset="utf-8"></script>
  </body>
  </html>
