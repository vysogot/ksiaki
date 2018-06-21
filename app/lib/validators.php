<?php

function validate_presence(&$params, $key) {
    if (!empty($params[$key])) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_present');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_not_null(&$params, $key) {
    if ($params[$key] != null) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_present');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_existance(&$params, $key, $result) {
    if (!empty($result)) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('not_found');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_email(&$params, $key) {
    if (filter_var($params[$key], FILTER_VALIDATE_EMAIL)) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_a_proper_email');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function is_slug($str) {
    return preg_match('/^[a-z0-9A-Z-]+$/i', $str);
}

function validate_slug(&$params, $key) {
    if (is_slug($params[$key])) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_a_proper_slug');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_uniqueness(&$params, $key, $db_result) {
    if (empty($db_result)) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_unique');
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_not_shorter_than(&$params, $key, $length) {
    if (strlen($params[$key]) >= $length) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_long_enough', ['length' => $length]);
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_not_longer_than(&$params, $key, $length) {
    if (strlen($params[$key]) <= $length) {
        return true;
    } else {
        $params['errors'][$key]['message'] = t('has_to_be_no_longer_than', ['length' => $length]);
        $params['errors'][$key]['field_translation'] = t($key);
        return false;
    }
}

function validate_distinctness(&$params, $keys) {

    $values = array_map(function($key) use($params) { return $params[$key]; }, $keys);

    if (count($values) == count(array_unique($values))) {
        return true;
    } else {
        $translated_keys = array_map(function($key) { return t($key); }, $keys);
        $params['errors']['NOT_A_FIELD']['message'] = implode(', ', $translated_keys) . ': ' . t('have_to_be_distinct');
        return false;
    }
}
