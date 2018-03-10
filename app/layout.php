<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
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
        <ul class="bare left">
            <li>
                <a href="/" id="menu-home"<?= activeClass('home') ?>>Home</a>
            </li>
            <li>
              <a href="/contests.php" id="menu-contests"<?= activeClass('contests') ?>>Konkursy</a>
            </li>
            <li>
              <a href="/rankings.php" id="menu-ranking"<?= activeClass('ranking') ?>>Ranking</a>
            </li>
            <li>
              <a href="/downloads.php" id="menu-download"<?= activeClass('download') ?>>Pobierz</a>
            </li>
            <?php if (currentUser()) { ?>
              <li>
                  <a href="/dashboard.php" id="menu-login"<?= activeClass('dashboard') ?>>Dashboard</a>
              </li>
            <?php } else { ?>
              <li>
                  <a href="/login.php" id="menu-login"<?= activeClass("login") ?>>Login</a>
              </li>
            <?php } ?>
          </ul>
        </nav>
      </div>
    </header>
    <main>
      <?php require 'partials/flashes.php'; ?>
      <?php content($params, $data); ?>
    </main>
    <footer>
      <div class="wrapper-full">
        <section id="static-sites">
          <div class="wrapper">
            <ul class="bare left">
              <li><a href="#">O nas</a></li>
              <li><a href="#">Dla rodziców</a></li>
              <li><a href="#">Regulamin</a></li>
              <li><a href="#">Polityka prywatności</a></li>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Kontakt</a></li>
            </ul>
          </div>
        </section>

        <section id="copyright">
          <div class="wrapper">
            <p>© Media Service Zawada sp. z o.o.</p>
          </div>
        </section>
      </div>
    </footer>

    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/slick.js" type="text/javascript" charset="utf-8"></script>
    <script src="/assets/js/app.js" type="text/javascript" charset="utf-8"></script>
  </body>
  </html>
