<?php

function validate($params, &$errors) {
  if (empty($params['name'])) {
    $errors['name'] = t('has_to_be_present');
  }
}
