<?php

const ENV = 'testing';

putenv('APPLICATION_ENV=' . ENV);
$envs = include realpath(__DIR__ . '/../../config/ksiaki.php');
$GLOBALS['config'] = $envs[ENV];
