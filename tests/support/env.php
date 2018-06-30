<?php

date_default_timezone_set('Europe/Warsaw');

const ENV = 'testing';

putenv('APPLICATION_ENV=' . ENV);
$envs = include realpath(__DIR__ . '/../../config/ksiaki.php');
$GLOBALS['config'] = $envs[ENV];