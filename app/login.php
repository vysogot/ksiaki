<?php

require 'init.php';

$params = [
  'login' => null,
  'password' => null,
  'remember_me' => null,
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

    if (is_admin()) {
      redirect('/admin/contests.php');
    } else {
      redirect('/');
    }

  } else {

    $params['errors']['login'] = 'login_failure';

  }

}

function content($params, $data) { ?>

<div class="wrapper">

  <?php require 'partials/errors.php'; ?>

        <h2><?= t('sign_in') ?></h2>
        <form action="<?= path_to('/login.php') ?>" method="post">

          <div>
              <label for="login"><?= t('name_or_email') ?></label>
              <input id="login" name="login" value="<?= $params['login'] ?>" required autofocus />
          </div>

          <div>
              <label for="password"><?= t('password') ?></label>
              <input id="password" type="password" name="password" required />
          </div>

          <div>
            <label for="remember_me"><?= t('remember_me') ?></label>
            <input type="hidden" name="remember_me" value="0" />
            <input id="remember_me" type="checkbox" value="1" name="remember_me" <?php if ($params['remember_me']) echo 'checked="checked"'; ?> />
          </div>

          <input type="submit" class="login-submit-button" value="Log in"/>

        </form>

        <a href="/register.php"><?= t('register') ?></a>

</div>

<?php }

require 'layout.php';
