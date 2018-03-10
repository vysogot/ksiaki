<?php

function validate($params, &$errors) {
  if (empty($params['name'])) {
    $errors['name'] = 'validate_presence';
  }
}
