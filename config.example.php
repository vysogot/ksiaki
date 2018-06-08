<?php

return array(
  'development' => array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '127.0.0.1',
    'DB_NAME' => 'ksiaki',
    'DB_USER' => 'root',
    'DB_PASS' => '',
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8',

    'protocol' => 'https://',

    'smtp_host' => 'smtp.gmail.com',
    'smtp_username' => 'jakub.godawa@gmail.com',
    'smtp_password' => 'password',
    'smtp_protocol' => 'ssl',
    'smtp_port' => 465,
    'smtp_from_email' => 'jakub.godawa@gmail.com',
    'smtp_from_name' => 'Jakub Godawa',
    'smtp_reply_to_email' => 'jakub.godawa@gmail.com',
    'smtp_reply_to_name' => 'Jakub Godawa'
  ),

  'testing' => array(
    'TESTING_BASE_URL' => 'https://ksiaki-test.www.jgodawa',
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '127.0.0.1',
    'DB_NAME' => 'ksiaki_test',
    'DB_USER' => 'root',
    'DB_PASS' => '',
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8',

    'protocol' => 'https://',

    'smtp_host' => 'smtp.testing.com',
    'smtp_username' => 'testing@email.com',
    'smtp_password' => 'password',
    'smtp_protocol' => 'ssl',
    'smtp_port' => 465,
    'smtp_from_email' => 'testing@email.com',
    'smtp_from_name' => 'Testing',
    'smtp_reply_to_email' => 'testing@email.com',
    'smtp_reply_to_name' => 'Testing'
  ),

  'production' => array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => '127.0.0.1',
    'DB_NAME' => 'ksiaki',
    'DB_USER' => 'root',
    'DB_PASS' => '',
    'DB_PORT' => '3306',
    'DB_CHARSET' => 'utf8',

    'protocol' => 'https://',

    'smtp_host' => 'smtp.production.com',
    'smtp_username' => 'production@email.com',
    'smtp_password' => 'password',
    'smtp_protocol' => 'ssl',
    'smtp_port' => 465,
    'smtp_from_email' => 'production@email.com',
    'smtp_from_name' => 'Production',
    'smtp_reply_to_email' => 'production@email.com',
    'smtp_reply_to_name' => 'Production',

    'sentry_key' => 'https://key@sentry.io/id'
  )
);
