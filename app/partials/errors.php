<?php if (isset($params['errors'])) { ?>
  <ul>
  <?php foreach($params['errors'] as $field => $message) { ?>
    <li><?= t($field) . ": " .  $message ?></li>
  <?php } ?>
  </ul>
<?php } ?>
