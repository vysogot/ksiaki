<?php

function e($value) {
  return htmlspecialchars($value);
}

function link_to($name, $destination) {
  echo "<a href=\"" . path_to($destination) . "\">$name</a>";
}

function redirect($destination)
{
  header("location: " . path_to($destination));
  exit();
}

function path_to($destination) {
  $root = $destination[0] == '/' ? $GLOBALS['base_url'] : $GLOBALS['url'];
  return $root . $destination;
}

function activeClass($link) {
    if (isset($GLOBALS['params']['active_link'])) {
      return $GLOBALS['params']['active_link'] == $link ? 'class="active"' : '';
    }
}

function currentUser() {
    return isset($_SESSION['user_id']);
}

function isAdmin() {
    if (isset($_SESSION['role_id'])) return $_SESSION['role_id'] == 2;
}

function flash($type, $message) {
  if (!isset($_SESSION['flashes'])) {
    $_SESSION['flashes'] = [];
  }

  $_SESSION['flashes'][] = ['type' => $type, 'message' => $message];
}
