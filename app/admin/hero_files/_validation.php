<?php

function validate(&$params) {
    validate_presence($params, 'hero_edition_id');
    validate_presence($params, 'name');
    validate_not_longer_than($params, 'name', 20);
}
