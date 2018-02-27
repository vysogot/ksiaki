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

      <nav>
        <ul class="bare left">
            <li>
                <a href="/" id="menu-home"<?php $this->helper->activeClass('App\\Controllers\\Home') ?>>Home</a>
            </li>
            <li>
              <a href="/contest/index" id="menu-contests"<?php $this->helper->activeClass('App\\Controllers\\Contest') ?>>Konkursy</a>
            </li>
            <li>
              <a href="/ranking/index" id="menu-ranking"<?php $this->helper->activeClass('App\\Controllers\\Ranking') ?>>Ranking</a>
            </li>
            <li>
              <a href="/download/index" id="menu-download"<?php $this->helper->activeClass('App\\Controllers\\Download') ?>>Pobierz</a>
            </li>
            <?php if (isset($this->current_user)) { ?>
              <li>
                  <a href="/dashboard/index" id="menu-login"<?php $this->helper->activeClass('App\\Controllers\\Dashboard') ?>>Dashboard</a>
                  <br/><a href="/session/destroy">Logout</a>
                    <?php if ('$this->current_user->isAdmin()') { ?>
                        <br/><a class="admin" href="/admin/">Admin</a>
                    <?php } ?>
              </li>
            <?php } else { ?>
              <li>
                  <a href="/session/new" id="menu-login"<?php $this->helper->activeClass("App\\Controllers\\Session") ?>>Login</a>
              </li>
            <?php } ?>
          </ul>
        </nav>
      </div>
    </header>
    <main>
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
