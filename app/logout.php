<?php

require 'init.php';

$_SESSION = array();

if (isset($_COOKIE[session_name()])) {
   setcookie(session_name(), '', time()-42000, '/');
}

session_destroy();

function content($params, $data) { ?>

<div class="wrapper">
  <h2><?= t('logged_out_safely') ?></h2>
</div>

<?php }

require 'layout.php';
