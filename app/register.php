<?php

require 'init.php';

$params = [
  'name' => null,
  'email' => null,
  'password' => null,
  'active_link' => 'login'
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
      flash('notice', 'registration_success');
    } else {
      flash('warning', 'registration_failure');
    }

    redirect('/');
  }

  $params['errors'] = $errors;

}

function content($params, $data) { ?>

<div class="wrapper">
    <h1>Sign up</h1>

    <?php require 'partials/errors.php'; ?>

    <form method="post" action="/register.php">

        <div>
            <label for="name">Name</label>
            <input id="name" name="name" placeholder="Name" value="<?= $params['name'] ?>" required autofocus />
        </div>
        <div>
            <label for="email">Email address</label>
            <input id="email" type="email" name="email" placeholder="email address" value="<?= $params['email'] ?>" required />
        </div>
        <div>
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Password" />
        </div>

        <button type="submit">Sign up</button>

    </form>

</div>

<?php }

require 'layout.php';
