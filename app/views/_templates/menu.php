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
            | <a href="/session/destroy">Logout</a>
              <?php if ($this->current_user->isAdmin()) { ?>
                  | <a class="admin" href="/admin/">Admin</a>
              <?php } ?>
        </li>
      <?php } else { ?>
        <li>
            <a href="/session/new" id="menu-login"<?php $this->helper->activeClass("App\\Controllers\\Session") ?>>Login</a>
        </li>
      <?php } ?>
    </ul>
  </nav>
