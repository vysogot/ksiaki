<?php

function validate($params, &$errors) {
  if (empty($params['title'])) {
    $errors['title'] = t('has_to_be_present');
  }
}
