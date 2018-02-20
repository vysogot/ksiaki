<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="<?php echo $this->url; ?>css/style.css?v=<?php echo filemtime("css/style.css")?>" />
    <link rel="stylesheet" type="text/css" href="<?php echo $this->url; ?>css/slick.css?v=<?php echo filemtime("css/style.css")?> "/>
    <link rel="stylesheet" type="text/css" href="<?php echo $this->url; ?>css/slick-theme.css?v=<?php echo filemtime("css/style.css")?>" />
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
                <a href="<?php echo $this->url; ?>" id="menu-home"<?php if ($this->helper->isActive('App\\Controllers\\Home')) { echo ' class="active"'; } ?>>Home</a>
            </li>
            <li>
              <a href="<?php echo $this->url; ?>contest/index" id="menu-contests"<?php if ($this->helper->isActive('App\\Controllers\\Contest')) { echo ' class="active"'; } ?>>Konkursy</a>
            </li>
            <li>
              <a href="<?php echo $this->url ?>ranking/index" id="menu-ranking"<?php if ($this->helper->isActive('App\\Controllers\\Ranking')) { echo ' class="active"'; } ?>>Ranking</a>
            </li>
            <li>
              <a href="<?php echo $this->url ?>download/index" id="menu-download"<?php if ($this->helper->isActive('App\\Controllers\\Download')) { echo ' class="active"'; } ?>>Pobierz</a>
            </li>
            <?php if (!'$this->current_user') { ?>
                <li>
                    <a href="<?php echo $this->url ?>dashboard/index" id="menu-login"<?php if ($this->helper->isActive('App\\Controllers\\Dashboard')) { echo ' class="active"'; } ?>>Dashboard</a>
                      <?php if ('$this->current_user->isAdmin()') { ?>
                          <br/><a class="admin" href="<?php echo $this->url; ?>admin/">Admin</a>
                      <?php } ?>
                </li>
            <?php } else { ?>
                <li>
                    <a href="<?php echo $this->url ?>session/index" id="menu-login"<?php if ($this->helper->isActive("'App\\Controllers\\Session'")) { echo ' class="active"'; } ?>>Login</a>
                </li>
            <?php } ?>
          </ul>
        </nav>
      </div>
    </header>
    <main>
