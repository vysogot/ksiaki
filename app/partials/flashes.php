<?php if (isset($_SESSION['flashes'])) { ?>
  <div class="wrapper">
    <?php foreach($_SESSION['flashes'] as $flash) { ?>
      <div class="<?= $flash['type'] ?>"><?= e($flash['message']); ?></div>
    <?php } ?>
  </div>
<?php }

unset($_SESSION['flashes']);
