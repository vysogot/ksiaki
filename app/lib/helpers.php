<?php

function e($value) {
  return htmlspecialchars($value);
}

function t($key) {
  return $GLOBALS['translations'][$key] ?? "TRANSLATE!!___$key";
}

function path_to($destination) {
  $root = $destination[0] == '/' ? $GLOBALS['base_url'] : $GLOBALS['url'];
  return $root . $destination;
}

function current_url() {
  return $_SERVER['PHP_SELF'] == '/index.php' ? '/' : $_SERVER['PHP_SELF'];
}

function current_user() {
    return isset($_SESSION['user_id']);
}

function is_admin() {
    if (isset($_SESSION['role_id'])) return $_SESSION['role_id'] == 2;
}

function redirect($destination)
{
  header("location: " . path_to($destination)); exit();
}

function flash($type, $message) {
  if (!isset($_SESSION['flashes'])) {
    $_SESSION['flashes'] = [];
  }

  $_SESSION['flashes'][] = ['type' => $type, 'message' => $message];
}

function link_to($name, $destination, $options = []) {
  $link = '<a href="' . path_to($destination) . '"';

  foreach($options as $key => $value) {
    $link .= ' ' . $key . '="' . $value . '"';
  }

  if (current_url() == $destination) {
    $link .= ' class="active"';
  }

  return $link . ">$name</a>";
}

function get_background() {
  $background = execute('call sp_backgrounds_get();', array());
  if (empty($background)) $background = execute('call sp_backgrounds_new();', array());
  return $background;
}

function file_upload($file) {
  $target_dir = __DIR__ . '/../uploads/';
  $target_file = $target_dir . basename($file["name"]);

  $check = getimagesize($file["tmp_name"]);

  if ($check !== false) {
      move_uploaded_file($file["tmp_name"], $target_file);
      return '/uploads/' . basename($file["name"]);
  }
}

function ranking_list($scores) {
  $html = '<ul>';

  foreach($scores as $score) {
    $html .= "<li>" . "$score->place. " . link_to($score->name, '/users.php?id=' . $score->user_id) .
    " – $score->points " . t('points') . "</li>";
  }

  return $html . '</ul>';
}
