<?php

function e($value) {
    return htmlspecialchars($value);
}

function interpolate($translation, $interpolations) {
    foreach ($interpolations as $key => $value) {
        $translation = preg_replace('/\{\{' . $key . '\}\}/', $interpolations[$key], $translation);
    }
    return $translation;
}

function t($key, $interpolations = []) {

    $translation = $GLOBALS['translations'][$key] ?? '';

    if (empty($translation)) {
        return "TRANSLATE!!: $key";
    } elseif (empty($interpolations)) {
        return $translation;
    } else {
        return interpolate($translation, $interpolations);
    }

}

function path_to($destination) {
    if (substr($destination, 0, 4) == 'http') return $destination;
    $root = $destination[0] == '/' ? $GLOBALS['base_url'] : $GLOBALS['url'];
    return $root . $destination;
}

function current_url() {
    return $_SERVER['PHP_SELF'] == '/index.php' ? '/' : $_SERVER['PHP_SELF'];
}

function is_logged_in() {
    return isset($_SESSION['user_id']);
}

function is_admin() {
    if (isset($_SESSION['role_id'])) return $_SESSION['role_id'] == 1;
}

function is_adult($birthday) {
    return ((time() - $birthday) < 18*(60*60*24*365));
}

function get_user_id() {
    return isset($_SESSION['user_id'])?$_SESSION['user_id']:0;
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

function image($src, $options = []) {
    $image = '<img src="' . $src . '"';

    foreach($options as $key => $value) {
        $image .= ' ' . $key . '="' . $value . '"';
    }

    return $image . ">";
}

function get_background() {
    $background = execute('call sp_backgrounds_get();', array());
    if (empty($background)) $background = execute('call sp_backgrounds_new();', array());
    return $background;
}

function file_upload($file) {
    $target_dir = __DIR__ . '/../uploads/';
    $target_file = $target_dir . basename($file["name"]);

    // hard limit to 100mb
    if ($file['size'] < 100000000) {
        move_uploaded_file($file["tmp_name"], $target_file);
        return '/uploads/' . basename($file["name"]);
    }
}

function ranking_list($scores) {
    $html = '<ul class="rankings">';

    foreach($scores as $score) {
        $html .= "<li>" . "$score->place. " . link_to($score->nick, '/profile.php?nick=' . urlencode($score->nick)) .
            " – $score->points " . t('points') . "</li>";
    }

    return $html . '</ul>';
}

function form_date($date) {
    return strftime('%Y-%m-%dT%H:%M:%S',strtotime($date));
}

function send_json($result) {
  header('Content-type: application/json');
  print json_encode(array($result));
}
