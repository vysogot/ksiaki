<?php

function validate_presence(&$params, $key) {
    if (!empty($params[$key])) {
        return true;
    } else {
        $params['errors'][t($key)] = t('has_to_be_present');
        return false;
    }
}

function validate_not_null(&$params, $key) {
    if ($params[$key] != null) {
        return true;
    } else {
        $params['errors'][t($key)] = t('has_to_be_present');
        return false;
    }
}

function validate_existance(&$params, $key, $result) {
    if (!empty($result)) {
        return true;
    } else {
        $params['errors'][t($key)] = t('not_found');
        return false;
    }
}

function validate_email(&$params, $key) {
    if (filter_var($params[$key], FILTER_VALIDATE_EMAIL)) {
        return true;
    } else {
        $params['errors'][t($key)] = t('has_to_be_a_proper_email');
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
        $params['errors'][t($key)] = t('has_to_be_a_proper_slug');
        return false;
    }
}

function validate_uniqueness(&$params, $key, $db_result) {
    if (empty($db_result)) {
        return true;
    } else {
        $params['errors'][t($key)] = t('has_to_be_unique');
        return false;
    }
}

function validate_not_shorter_than(&$params, $key, $length) {
    if (strlen($params[$key]) >= $length) {
        return true;
    } else {
        $params['errors'][t($key)] = t('has_to_be_long_enough', ['length' => $length]);
        return false;
    }
}
