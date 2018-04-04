<?php

/* browsing */

function when_i_go_to($path) {
  curl_get($path);
}

function when_i_submit($path, $data) {
  curl_post($path, $data);
}

/* assertions */

function i_should_see($text) {
  return preg_match('/' . preg_quote($text, '/') . '/', output());
}

function i_should_not_see($text) {
  return !i_should_see($text);
}
