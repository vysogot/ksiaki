<?php

function e($value) {
  return htmlspecialchars($value);
}

function redirect($path)
{
  if ($path[0] == '/') {
    header("location: " . $GLOBALS['url'] . $path);
  } else {
    header("location: " . $GLOBALS['base_url'] . $path);
  }

  exit();
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
