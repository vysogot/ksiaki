<?php if (!empty($this->flashes)) { ?>
  <div class="wrapper">
    <?php foreach($this->flashes as $type => $message) { ?>
      <div class="<?= $type ?>"><?= e("$message"); ?></div>
    <?php } ?>
  </div>
<?php } ?>
