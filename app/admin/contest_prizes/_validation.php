<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_not_longer_than($params, 'name', 25);
    validate_presence($params, 'contest_id');
    validate_presence($params, 'sponsor_id');
}
