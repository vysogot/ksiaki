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
  <div id="page">
    <div id="wrapper">

        <div id="logo">
          <img src="/images/logo.png" />
        </div>

        <div id="banner" class="slider">
          <div><img src="/images/banner-1.png" /></div>
          <div><img src="/images/banner-2.png" /></div>
        </div>

        <div id="nav">
          <!-- navigation -->
          <ul>
              <li <?php if (View::checkForActiveController($filename, "index")) { echo ' class="active" '; } ?> >
                  <a href="<?php echo Config::get('URL'); ?>index/index" id="menu-home">Home</a>
              </li>
              <li>
                <a href="#" id="menu-contests">Konkursy</a>
              </li>
              <li>
                <a href="#" id="menu-rank">Ranking</a>
              </li>
              <li>
                <a href="#" id="menu-download">Pobierz</a>
              </li>
              <?php if (Session::userIsLoggedIn()) { ?>
                  <li <?php if (View::checkForActiveController($filename, "dashboard")) { echo ' class="active" '; } ?> >
                      <a href="<?php echo Config::get('URL'); ?>dashboard/index">Dashboard</a>
                  </li>
                  <li <?php if (View::checkForActiveController($filename, "note")) { echo ' class="active" '; } ?> >
                      <a href="<?php echo Config::get('URL'); ?>note/index">My Notes</a>
                  </li>
              <?php } else { ?>
                  <!-- for not logged in users -->
                  <li <?php if (View::checkForActiveControllerAndAction($filename, "login/index")) { echo ' class="active" '; } ?> >
                      <a href="<?php echo Config::get('URL'); ?>login/index" id="menu-login">Login</a>
                  </li>
                  <li <?php if (View::checkForActiveControllerAndAction($filename, "register/index")) { echo ' class="active" '; } ?> >
                      <a href="<?php echo Config::get('URL'); ?>register/index">Register</a>
                  </li>
              <?php } ?>
          </ul>

        <!-- my account -->
        <ul class="navigation right">
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
