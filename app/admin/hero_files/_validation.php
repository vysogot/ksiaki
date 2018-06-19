<?php

function validate(&$params) {
    validate_presence($params, 'hero_id');
    validate_presence($params, 'name');
}
