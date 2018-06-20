<?php

function validate(&$params) {
    validate_presence($params, 'subject');
    validate_presence($params, 'content');
}
