<?php

function validate(&$params) {
    return validate_presence($params, 'name');
}
