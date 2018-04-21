<?php

const ENV = 'testing';

putenv('APPLICATION_ENV=' . ENV);
$envs = include realpath(__DIR__ . '/../../../ksiaki_config.php');
$GLOBALS['config'] = $envs[ENV];
