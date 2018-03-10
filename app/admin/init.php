<?php

require realpath(__DIR__ . '/../init.php');

if (!isAdmin()) {
  flash('notice', 'not_authorized');
  redirect('/login.php');
}
