<?php

function validate(&$params) {
    validate_presence($params, 'name');
    validate_presence($params, 'link_url');
}
