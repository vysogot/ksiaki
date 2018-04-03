<?php

require 'init.php';

$params = [
  'login' => null,
  'password' => null,
  'active_link' => 'login'
];

if ($post) {

  $params = array_merge($params, $_POST);

  $result = execute('call sp_users_find_by_name_or_email(:p_name_or_email);', array(
    array('p_name_or_email', $params['login'], PDO::PARAM_STR)
  ));

  if (!empty($result) && password_verify($params['password'], $result->password_hash)) {

    session_regenerate_id(true);
    $_SESSION['user_id'] = $result->id;
    $_SESSION['role_id'] = $result->role_id;

    flash('notice', t('login_success'));
    redirect('/');

  } else {

    $params['errors']['login'] = 'login_failure';

  }

}

function content($params, $data) { ?>

<div class="wrapper">

  <?php require 'partials/errors.php'; ?>

  <form action="<?= path_to('/login.php') ?>" method="post" class="vertical-form">

    <legend><h2><?= t('sign_in') ?></h2></legend>

    <input id="login" type="text" name="login" placeholder="<?= t('name_or_email') ?>" value="<?= $params['login'] ?>" required autofocus />
    <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" required />
    <input type="submit" value="<?= t('log_in') ?>"/>

    <p><?= link_to(t('register'), '/register.php') ?></p>

  </form>

</div>

<?php }

require 'layout.php';
