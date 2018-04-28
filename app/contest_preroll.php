<?php

include 'init.php';

$params = [
  "id" => null
];

$params = array_merge($params, $_GET);

function content($params, $data) { ?>

<div class="wrapper center">
  <video controls autoplay id="preroll" preload="none" poster="/uploads/movie-1.jpg" src="/uploads/movie-1.mov"></video>

  <?php if (getenv('APPLICATION_ENV') != 'production') { ?>
    <h2 class="center"><?= link_to(t('play'), "/contest_play.php?id=" . $params['id']) ?></h2>
  <?php } ?>
</div>

<?php }

function before_body_close() { ?>
  <script type="text/javascript">
  $(document).on('ready', function() {
    $('#preroll').on('ended', function() {
        location.href = '<?= "/contest_play.php?id=" . $_GET['id'] ?>';
    });
  });
  </script>
<?php }

include 'layout.php';
