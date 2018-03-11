<?php

require realpath(__DIR__ . '/../init.php');

if (!is_admin()) {
  flash('notice', t('unauthorized'));
  redirect('/login.php');
}
