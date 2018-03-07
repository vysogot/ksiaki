<?php foreach($this->flashes as $type => $message) { ?>
  <div class="<?= $type ?>"><?= e("$message"); ?></div>
<?php } ?>
