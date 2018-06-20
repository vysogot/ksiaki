<?php

include 'init.php';

$params = [
    'login' => null,
    'password' => null,
    'active_link' => 'login'
];

if ($post) {

    $params = array_merge($params, $_POST);

    $result = execute('call sp_users_find_by_nick_or_email(:p_nick_or_email);', array(
        array('p_nick_or_email', $params['login'], PDO::PARAM_STR)
    ));

    if (validate_existance($params, 'login', $result)) {

        if (empty($result->password_hash)) {

            if ($result->is_active) {

                $password_reset_hash = bin2hex(random_bytes(32));

                $reset_request_result = execute('call sp_users_password_reset_request(:p_email, :p_password_reset_hash);', array(
                    array('p_email', $result->email, PDO::PARAM_STR),
                    array('p_password_reset_hash', $password_reset_hash, PDO::PARAM_STR)
                ));

                flash('warning', t('known_user_password_reset'));

                send_email($result->email, [
                    'subject' => t('email_subject_password_reset_request'),
                    'body' => link_to('Click', '/password_reset_form.php?key=' . $reset_request_result->password_reset_hash),
                    'name' => $result->name . ' ' . $result->surname
                ]);

            } else {

                flash('warning', t('account_inactive_please_contact'));

            }

        } elseif (password_verify($params['password'], $result->password_hash)) {

            if ($result->is_active) {

                if ($result->caretaker_check) {

                    session_regenerate_id(true);
                    $_SESSION['user_id'] = $result->id;
                    $_SESSION['role_id'] = $result->role_id;
                    $_SESSION['nick'] = $result->nick;

                    $result = execute('call sp_user_login(:p_user_id, :p_session_id);', array(
                        array('p_user_id', $result->id, PDO::PARAM_INT),
                        array('p_session_id', session_id(), PDO::PARAM_STR)
                    ));

                    flash('notice', t('login_success'));

                } else {

                    flash('warning', t('caretaker_acceptance_needed'));

                }

            } else {

                flash('warning', t('login_activation_needed'));

            }

            redirect('/');

        } else {

            $params['errors']['login'] = t('login_failure');

        }

    }

}

function content($params, $data) { ?>

    <div class="wrapper">

        <form action="<?= path_to('/login.php') ?>" method="post" class="vertical-form">

            <legend>
                <h2>
                    <?= t('sign_in') ?>
                </h2>
            </legend>
            <?php include 'partials/errors.php'; ?>

            <?= csrf_field() ?>
                <input id="login" type="text" name="login" placeholder="<?= t('nick_or_email') ?>" value="<?= $params['login'] ?>" required autofocus />
                <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" required />
                <input type="submit" value="<?= t('log_in') ?>" />

                <p>
                    <?= link_to(t('forgot_password'), '/password_reset_request.php') ?>
                </p>
                <p>
                    <?= t('no_account_yet') ?>
                        <?= link_to(t('register'), '/register.php') ?>
                </p>

        </form>

    </div>

    <?php }

include 'layout.php';
