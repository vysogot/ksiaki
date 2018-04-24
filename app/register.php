<?php

include 'init.php';

$params = [
    'name' => null,
    'email' => null,
    'password' => null
];

if ($post) {

    $params = array_merge($params, $_POST);
    var_dump($params);

    if (validate_presence($params, 'name')) {

        $result = execute('call sp_users_find_by_name_or_email(
            :p_name_or_email
        );', array(
            array('p_name_or_email', $params['name'], PDO::PARAM_STR)
        ));

        validate_uniqueness($params, 'name', $result);
    }

    if (validate_email($params, 'email')) {

        $result = execute('call sp_users_find_by_name_or_email(
            :p_name_or_email
        );', array(
            array('p_name_or_email', $params['email'], PDO::PARAM_STR)
        ));

        validate_uniqueness($params, 'email', $result);
    }

    validate_not_shorter_than($params, 'password', 6);


    if (empty($params['errors'])) {

        $password_hash = password_hash($params['password'], PASSWORD_DEFAULT);

        $result = execute('call sp_users_register(
            :p_name, 
            :p_email, 
            :p_password_hash
        );', array(
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

}

function content($params, $data) { ?>

<div class="wrapper">

    <?php include 'partials/errors.php'; ?>

    <form method="post" action="/register.php" id="register" class="vertical-form" accept-charset="UTF-8">

        <legend><h2><?= t('register') ?></h2></legend>

        <input id="name" type="text" name="name" placeholder="<?= t('name') ?>" value="<?= $params['name'] ?>" included autofocus />
        <input id="email" type="email" placeholder="<?= t('email') ?>" name="email" value="<?= $params['email'] ?>" included />
        <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" />

        <input type="submit" value="<?= t('sign_up') ?>" />

        <p><a href="/login.php"><?= t('login') ?></a></p>

    </form>

</div>

<?php }

include 'layout.php';
