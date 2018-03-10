<?php

require '../init.php';

$params = [
  'active_link' => 'contests',
  'form_action' => 'create.php'
];

$data = execute('call sp_contests_new();', []);

function content($params, $data) { ?>

<div class="wrapper">
  <h2>Nowy konkurs</h2>
  <a href="/admin/contests.php">Konkursy</a>
  <?php require '_form.php'; ?>
</div>

<?php }

require '../layout.php';
