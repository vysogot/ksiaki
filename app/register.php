<?php

require 'init.php';

$params = [
  'name' => null,
  'email' => null,
  'password' => null
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  $params = array_merge($params, $_POST);

  if (empty($params['name'])) {
    $errors['name'] = 'validate_presence';
  } else {

    $result = execute('call sp_users_find_by_name_or_email(:p_name_or_email);', array(
      array('p_name_or_email', $params['name'], PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      $errors['name'] = 'validate_uniqueness';
    }
  }

  if (filter_var($params['email'], FILTER_VALIDATE_EMAIL)) {

    $result = execute('call sp_users_find_by_name_or_email(:p_name_or_email);', array(
      array('p_name_or_email', $params['email'], PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      $errors['email'] = 'validate_uniqueness';
    }

  } else {
    $errors['email'] = 'validate_email_syntax';
  }

  if (strlen($params['password']) < 6) {
    $errors['password'] = 'validate_password_length';
  }

  if (empty($errors)) {

    $password_hash = password_hash($params['password'], PASSWORD_DEFAULT);

    $result = execute('call sp_users_create(:p_name, :p_email, :p_password_hash);', array(
      array('p_name', $params['name'], PDO::PARAM_STR),
      array('p_email', $params['email'], PDO::PARAM_STR),
      array('p_password_hash', $password_hash, PDO::PARAM_STR)
    ));

    if (!empty($result)) {
      flash('notice', t('registration_success'));
    } else {
      flash('warning', t('registration_failure'));
    }

    redirect('/');
  }

  $params['errors'] = $errors;

}

function content($params, $data) { ?>

<div class="wrapper">

    <?php require 'partials/errors.php'; ?>

    <form method="post" action="/register.php" id="register" class="vertical-form" accept-charset="UTF-8">

        <legend><h1><?= t('sign_up') ?></h1></legend>

        <input id="name" type="text" name="name" placeholder="<?= t('name') ?>" value="<?= $params['name'] ?>" required autofocus />
        <input id="email" type="email" placeholder="<?= t('email') ?>" name="email" value="<?= $params['email'] ?>" required />
        <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" />

        <input type="submit" value="<?= t('sign_up') ?>" />

        <p><a href="/login.php"><?= t('login') ?></a></p>

    </form>

</div>

<?php }

require 'layout.php';
