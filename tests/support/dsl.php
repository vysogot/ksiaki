<?php

/* browsing */

function when_i_go_to($path) {
  curl_get($path);
}

function and_i_go_to($path) {
  when_i_go_to($path);
}

function when_i_submit($path, $data) {
  curl_post($path, $data);
}

function should_give_no_error($path) {
  curl_get($path);
  return 200 == output('response_header')['http_code'];
}

function when_i_login_as($username, $password = '12345678') {
  when_i_submit('/login.php', [
    'login' => $username,
    'password' => '12345678'
  ]);
}

/* assertions */

function i_should_see($text) {
  return preg_match('/' . preg_quote($text, '/') . '/', output());
}

function i_should_not_see($text) {
  return !i_should_see($text);
}
