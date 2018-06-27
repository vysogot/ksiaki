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
    return $_SERVER['PHP_SELF'] == '/index.php' ? '/' : $_SERVER['REQUEST_URI'];
}

function is_logged_in() {
    return isset($_SESSION['user_id']);
}

function is_admin() {
    if (isset($_SESSION['role_id'])) return $_SESSION['role_id'] == 1;
}

function is_adult($birthday) {
    return ((time() - $birthday) >= 18*(60*60*24*365));
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

function link_to($name, $destination, $options = [], $props = []) {
    $link = '<a href="' . secure_url(path_to($destination)) . '"';

    foreach($options as $key => $value) {
        $link .= ' ' . $key . '="' . $value . '"';
    }

    if (current_url() == $destination) {
        $link .= ' class="active"';
    }

    foreach($props as $prop) {
        $link .= ' ' . $prop;
    }

    return $link . ">$name</a>";
}

function secure_url($url) {
    return str_replace('http://', $GLOBALS['config']['protocol'], $url);
}

function image($src, $options = []) {
    $image = '<img src="' . secure_url($src) . '"';

    foreach($options as $key => $value) {
        $image .= ' ' . $key . '="' . $value . '"';
    }

    return $image . ">";
}

function current_session($key) {
    return $_SESSION[$key] ?? null;
}

function website_title($params) {

    $title = t('website_title');

    if (isset($params['title'])) {
        $title = $params['title'] . ' | ' . $title;
    }

    return $title;

}

function get_background($placement) {

    $background = execute('call sp_backgrounds_get(
        :p_placement
    );', array(
        array('p_placement', $placement, PDO::PARAM_STR)
    ));

    return $background;
}

function file_upload($file, $options = []) {

    $filename = basename($file["name"]);
    $ext = file_extension($filename);

    if (isset($options['filename'])) {
        $filename = $options['filename'] . ".$ext";
    }

    $subdir = $options['subdir'] ?? '';

    $relative_filepath =  '/' . $subdir . '/' . time() . '-' . $filename;
    $physical_filepath = str_replace('//', '/', $GLOBALS['config']['uploads_dir'] . $relative_filepath);

    // hard limit to 100mb
    if ($file['size'] < 100000000) {
        move_uploaded_file($file["tmp_name"], $physical_filepath);

        if ($GLOBALS['env'] == 'development') {
            $relative_filepath = '/uploads/' . $relative_filepath;
        }

        if (isset($options['thumbnail']) && $options['thumbnail'] == true) {
            create_thumbnail($physical_filepath, $ext);
        }

        return cdn_url($relative_filepath);
    }
}

function create_thumbnail($physical_filepath, $ext) {

    if (in_array($ext, ['jpg', 'jpeg', 'gif', 'png'])) {
        $image = new Imagick($physical_filepath);

        try {
            $image->scaleImage(300, 300, true);
        } catch (Exception $e) {
            $image->resizeImage(300, 300, Imagick::FILTER_CATROM, 0, true);
        }

        $output_file_path = thumbnail_name($physical_filepath);
        $output_file = fopen($output_file_path, "w");

        if (fwrite($output_file, $image->getImageBlob()) === false) {
          throw new Exception("Error writing to file: $output_file_path");
        }

        fclose($output_file);
    }

}

function file_extension($filename) {
    return pathinfo($filename, PATHINFO_EXTENSION);
}

function thumbnail_name($filename) {
    $ext = file_extension($filename);
    return str_replace(".$ext", "_thumb.$ext", $filename);
}

function cdn_url($src) {
    if (substr($src, 0, 4) == 'http') return $src;

    return secure_url($GLOBALS['config']['cdn'] . $src);
}

function ranking_list($scores) {
    $html = '<ul class="rankings">';

    foreach($scores as $score) {
        $html .= "<li>" . link_to($score->nick, '/profile.php?nick=' . urlencode($score->nick)) .
            " – " . number_format($score->points,0,'',chr(32)) . "</li>";
    }

    return $html . '</ul>';
}

function form_date($date) {
    return strftime('%Y-%m-%dT%H:%M:%S',strtotime($date));
}

function send_json($result) {
  header('Content-type: application/json');

  $result = is_array($result) ? $result : array($result);
  print json_encode($result);
}


function set_csrf_token() {
    $_SESSION['token'] = generate_random_hash();
}

function get_csrf_token() {
    if (!isset($_SESSION['token'])) {
      set_csrf_token();
    }

    return $_SESSION['token'];
}

function csrf_field() {
    return '<input type="hidden" name="token" value="' . get_csrf_token() . '" />';
}

function slugify($str, $max_length = 50) {
    $polish = array('/ą/', '/ż/', '/ź/', '/ę/', '/ć/', '/ń/', '/ó/', '/ł/', '/ś/', '/Ą/', '/Ż/', '/Ź/', '/Ę/', '/Ć/', '/Ń/', '/Ó/', '/Ł/', '/Ś/');
    $ascii = array('a', 'z', 'z', 'e', 'c', 'n', 'o', 'l', 's', 'A', 'Z', 'Z', 'E', 'C', 'N', 'O', 'L', 'S');
    $str = preg_replace($polish, $ascii, $str);
    $str = strtolower(trim($str));
    $str = preg_replace('/\?/', '', $str);
    $str = preg_replace('/[^a-z0-9-]/', '-', $str);
    $str = preg_replace('/-+/', "-", $str);
    $str = substr($str, 0, $max_length);
    return $str;
}

function is_production_env() {
    return $GLOBALS['env'] == 'production';
}

function is_testing_env() {
    return $GLOBALS['env'] == 'testing';
}

function is_development_env() {
    return $GLOBALS['env'] == 'development';
}

function params($key) {
    if (isset($GLOBALS['params'][$key])) {
        return e($GLOBALS['params'][$key]);
    } else {
        return '';
    }
}

function sanitize(&$params) {
    array_walk($params, function(&$value, $key) {
        $value = e($value);
    });
}

function must_be_logged_in() {
    if (!is_logged_in()) {
        flash('notice', t('unauthorized'));
        redirect('/login.php');
    }
}

function must_be_an_admin() {
    if (!is_admin()) {
        flash('notice', t('unauthorized'));
        redirect('/login.php');
    }
}

function generate_random_hash($length = 8) {
    return bin2hex(random_bytes($length));
}
