<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/css/slick-theme.css" />
</head>
<body>
  <header>
    <div class="wrapper">

      <div id="logo">
        <a href="/"><img src="/images/logo.png" /></a>
      </div>

      <div id="banner" class="slider">
        <div><img src="/images/banner-1.png" /></div>
        <div><img src="/images/banner-2.png" /></div>
      </div>

      <?php require 'menu.php' ?>
      </div>
    </header>
    <main>
      <?php require 'flashes.php'; ?>
      <?php require $partial; ?>
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

    <script src="/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/js/slick.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/app.js" type="text/javascript" charset="utf-8"></script>
  </body>
  </html>
