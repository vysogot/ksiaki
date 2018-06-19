<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_presence($params, 'description');

    if (empty($params['slug'])) {
        $params['slug'] = slugify($params['name']);
    }

    validate_slug($params, 'slug');
}
