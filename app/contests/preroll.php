<?php

require '../init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

function content($params, $data) { ?>

<div class="wrapper center">
  <video controls autoplay id="preroll" preload="none" poster="/uploads/movie-1.jpg" src="/uploads/movie-1.mp4"></video>
  <h2 class="center">TEN LINK BĘDZIE USUNIĘTY: <?= link_to(t('play'), "/contests/play.php?id=" . $params['id']) ?></h2>
</div>

<?php }

function before_body_close() { ?>
  <script type="text/javascript">
  $(document).on('ready', function() {
    $('#preroll').on('ended', function() {
        location.href = '<?= "/contests/play.php?id=" . $_GET['id'] ?>';
    });
  });
  </script>
<?php }

require '../layout.php';
