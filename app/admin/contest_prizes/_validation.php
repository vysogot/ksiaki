<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_presence($params, 'contest_id');
    validate_presence($params, 'sponsor_id');
}
