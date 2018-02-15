<?php

namespace Core;

require '../vendor/autoload.php';

new Router(Request::get('url'));
