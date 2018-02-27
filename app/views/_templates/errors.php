<?php if (!empty($this->errors)) { ?>
  <ul>
  <?php foreach($this->errors as $field => $message) { ?>
    <li><?= e("$field: $message"); ?></li>
  <?php } ?>
  </ul>
<?php } ?>
