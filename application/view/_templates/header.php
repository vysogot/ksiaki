<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="<?php echo Config::get('URL'); ?>css/style.css?v=<?php echo filemtime("css/style.css")?>" />
    <link rel="stylesheet" type="text/css" href="<?php echo Config::get('URL'); ?>css/slick.css?v=<?php echo filemtime("css/style.css")?> "/>
    <link rel="stylesheet" type="text/css" href="<?php echo Config::get('URL'); ?>css/slick-theme.css?v=<?php echo filemtime("css/style.css")?>" />
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
                <a href="<?php echo Config::get('URL'); ?>" id="menu-home"<?php if (View::checkForActiveController($filename, "home")) { echo ' class="active"'; } ?>>Home</a>
            </li>
            <li>
              <a href="<?php echo Config::get('URL'); ?>contest/index" id="menu-contests"<?php if (View::checkForActiveController($filename, "contest")) { echo ' class="active"'; } ?>>Konkursy</a>
            </li>
            <li>
              <a href="<?php echo Config::get('URL'); ?>ranking/index" id="menu-ranking"<?php if (View::checkForActiveController($filename, "ranking")) { echo ' class="active"'; } ?>>Ranking</a>
            </li>
            <li>
              <a href="<?php echo Config::get('URL'); ?>download/index" id="menu-download"<?php if (View::checkForActiveController($filename, "download")) { echo ' class="active"'; } ?>>Pobierz</a>
            </li>
            <?php if (Session::userIsLoggedIn()) { ?>
                <li>
                    <a href="<?php echo Config::get('URL'); ?>dashboard/index" id="menu-login"<?php if (View::checkForActiveController($filename, "dashboard")) { echo ' class="active"'; } ?>>Dashboard</a>
                      <?php if (Session::get("user_account_type") == 7) : ?>
                          <br/><a class="admin" href="<?php echo Config::get('URL'); ?>admin/">Admin</a>
                      <?php endif; ?>
                </li>
            <?php } else { ?>
                <li>
                    <a href="<?php echo Config::get('URL'); ?>login/index" id="menu-login"<?php if (View::checkForActiveControllerAndAction($filename, "login/index")) { echo ' class="active"'; } ?>>Login</a>
                </li>
            <?php } ?>
          </ul>
        </nav>
      </div>
    </header>
    <main>
