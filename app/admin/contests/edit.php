<?php

require '../init.php';

$params = [
  'id' => null,
  'active_link' => 'contests',
  'form_action' => 'update.php'
];

$params = array_merge($params, $_GET);

$data = execute('call sp_contests_find(:p_id);', array(
  array('p_id', $params['id'], PDO::PARAM_INT)
));

function content($params, $data) { ?>

  <div class="wrapper">
    <h2>Edycja konkursu</h2>
    <a href="/admin/contests.php">Konkursy</a>
    <?php require '_form.php'; ?>
  </div>

<?php }

require '../layout.php';
