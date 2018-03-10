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

    flash('notice', 'login_success');

    if (isAdmin()) {
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

        <h2>Login here</h2>
        <form action="/login.php" method="post">

          <div>
              <label for="login">Name or email</label>
              <input id="login" name="login" placeholder="Name or email" value="<?= $params['login'] ?>" required autofocus />
          </div>

          <div>
              <label for="password">Password</label>
              <input id="password" type="password" name="password" placeholder="Password" required />
          </div>

          <div>
            <label for="remember_me">Remember me</label>
            <input type="hidden" name="remember_me" value="0" />
            <input id="remember_me" type="checkbox" value="1" name="remember_me" <?php if ($params['remember_me']) echo 'checked="checked"'; ?> />
          </div>

          <input type="submit" class="login-submit-button" value="Log in"/>

        </form>

        <a href="/register.php">Register</a>

</div>

<?php }

require 'layout.php';
