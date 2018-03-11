<?php

switch (substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2)) {
  case 'en':
    require realpath(__DIR__ . '/locals/en.php');
    break;
  default:
    require realpath(__DIR__ . '/locals/pl.php');
    break;
}
