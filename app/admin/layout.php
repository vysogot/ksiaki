<!doctype html>
<html>
<head>
    <title>Konkursiaki</title>
    <meta charset="utf-8">
    <link rel="icon" href="data:;base64,=">
</head>
<body>
  <header>
    <div class="wrapper">
      <nav>
        <ul class="bare left">
          <li>
            <a href="/">Strona główna</a>
          </li>
            <li>
              <a href="/admin/users.php" <?= activeClass('users') ?>>Użytkownicy</a>
            </li>
            <li>
              <a href="/admin/contests.php" <?= activeClass('contests') ?>>Konkursy</a>
            </li>
            <li>
              <a href="/admin/rankings.php" <?= activeClass('ranking') ?>>Rankingi</a>
            </li>
            <li>
              <a href="/admin/downloads.php" <?= activeClass('download') ?>>Pobrania</a>
            </li>
            <li>
                <a href="/logout.php" <?= activeClass("login") ?>>Wyloguj</a>
            </li>
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
            <p>© Media Service Zawada sp. z o.o.</p>
          </div>
        </section>
      </div>
    </footer>
    <script src="/assets/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/assets/js/app.js" type="text/javascript" charset="utf-8"></script>
  </body>
  </html>
