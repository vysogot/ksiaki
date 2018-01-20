<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
    <!-- META -->
    <meta charset="utf-8">
    <!-- send empty favicon fallback to prevent user's browser hitting the server for lots of favicon requests resulting in 404s -->
    <link rel="icon" href="data:;base64,=">
    <!-- CSS -->
    <link rel="stylesheet" href="<?php echo Config::get('URL'); ?>css/style.css?v=<?php echo filemtime("css/style.css")?>" rel="styleshee" />
    <link rel="stylesheet" type="text/css" href="<?php echo Config::get('URL'); ?>css/slick.css?v=<?php echo filemtime("css/style.css")?>"/>
    <link rel="stylesheet" type="text/css" href="<?php echo Config::get('URL'); ?>css/slick-theme.css?v=<?php echo filemtime("css/style.css")?>"/>

</head>
<body>
  <header>
    <div class="wrapper">
        <div id="logo">
          <img src="/images/logo.png" />
        </div>

        <div id="banner" class="slider">
          <div><img src="/images/banner-1.png" /></div>
          <div><img src="/images/banner-2.png" /></div>
        </div>
      </div>
    </header>

        <nav>
          <div class="wrapper">
          <!-- navigation -->
          <ul class="bare left">
              <li>
                  <a href="<?php echo Config::get('URL'); ?>" id="menu-home" <?php if (View::checkForActiveController($filename, "index")) { echo ' class="active" '; } ?>>Home</a>
              </li>
              <li>
                <a href="<?php echo Config::get('URL'); ?>contest/index" id="menu-contests" <?php if (View::checkForActiveController($filename, "contest")) { echo ' class="active" '; } ?>>Konkursy</a>
              </li>
              <li>
                <a href="<?php echo Config::get('URL'); ?>ranking/index" id="menu-ranking" <?php if (View::checkForActiveController($filename, "ranking")) { echo ' class="active" '; } ?>>Ranking</a>
              </li>
              <li>
                <a href="<?php echo Config::get('URL'); ?>download/index" id="menu-download" <?php if (View::checkForActiveController($filename, "download")) { echo ' class="active" '; } ?>>Pobierz</a>
              </li>
              <?php if (Session::userIsLoggedIn()) { ?>
                  <li>
                      <a href="<?php echo Config::get('URL'); ?>dashboard/index"  <?php if (View::checkForActiveController($filename, "dashboard")) { echo ' class="active" '; } ?>>Dashboard</a>
                  </li>
                  <li>
                      <a href="<?php echo Config::get('URL'); ?>note/index" <?php if (View::checkForActiveController($filename, "note")) { echo ' class="active" '; } ?>>My Notes</a>
                  </li>
              <?php } else { ?>
                  <!-- for not logged in users -->
                  <li>
                      <a href="<?php echo Config::get('URL'); ?>login/index" id="menu-login" <?php if (View::checkForActiveControllerAndAction($filename, "login/index")) { echo ' class="active" '; } ?>>Login</a>
                  </li>
              <?php } ?>
          </ul>

        <!-- my account -->
        <ul class="bare right">
        <?php if (Session::userIsLoggedIn()) : ?>
            <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                <a href="<?php echo Config::get('URL'); ?>user/index">My Account</a>
                <ul class="navigation-submenu">
                    <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>user/changeUserRole">Change account type</a>
                    </li>
                    <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>user/editAvatar">Edit your avatar</a>
                    </li>
                    <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>user/editusername">Edit my username</a>
                    </li>
                    <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>user/edituseremail">Edit my email</a>
                    </li>
                    <li <?php if (View::checkForActiveController($filename, "user")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>user/changePassword">Change Password</a>
                    </li>
                    <li <?php if (View::checkForActiveController($filename, "login")) { echo ' class="active" '; } ?> >
                        <a href="<?php echo Config::get('URL'); ?>login/logout">Logout</a>
                    </li>
                </ul>
            </li>
            <?php if (Session::get("user_account_type") == 7) : ?>
                <li <?php if (View::checkForActiveController($filename, "admin")) {
                    echo ' class="active" ';
                } ?> >
                    <a href="<?php echo Config::get('URL'); ?>admin/">Admin</a>
                </li>
            <?php endif; ?>
        <?php endif; ?>
        </ul>
      </div>
      </nav>
<main>
