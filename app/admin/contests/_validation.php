<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_not_longer_than($params, 'name', 25);

    if (empty($params['slug'])) {
        $params['slug'] = slugify($params['name']);
    }

    validate_slug($params, 'slug');

    validate_presence($params, 'begins_at');
    validate_presence($params, 'ends_at');
}
