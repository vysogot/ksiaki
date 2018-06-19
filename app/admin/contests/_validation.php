<?php

function validate(&$params) {
    validate_presence($params, 'name');

    if (empty($params['slug'])) {
        $params['slug'] = slugify($params['name']);
    }

    validate_slug($params, 'slug');

    validate_presence($params, 'begins_at');
    validate_presence($params, 'ends_at');
}
