<?php

function validate($params, &$errors) {
  if (empty($params['name'])) {
    $errors['name'] = t('validate_presence');
  }
}
