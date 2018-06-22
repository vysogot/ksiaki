<?php

function rollbar_deploy() {

    $envs = include realpath(__DIR__ . '/config/ksiaki.php');
    $config = $envs['production'];

    $url = 'https://api.rollbar.com/api/1/deploy/';
    $data = array(
        'access_token' => $config['rollbar_key'],
        'environment' => 'production',
        'revision' => exec('git log -n 1 --pretty=format:"%H"'),
        'local_username' => 'ksiaki-production'
    );

    $options = array(
        'http' => array(
            'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
            'method'  => 'POST',
            'content' => http_build_query($data)
        )
    );

    $context  = stream_context_create($options);
    return file_get_contents($url, false, $context);
}

rollbar_deploy();
