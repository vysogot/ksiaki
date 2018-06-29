<?php

include 'init.php';

if ($post) {

    $params = array_merge($params, $_POST);

    $user = execute('call sp_users_find_by_nick_or_email(:p_nick_or_email);', array(
        array('p_nick_or_email', $params['login'], PDO::PARAM_STR)
    ));

    if (validate_existance($params, 'login', $user)) {

        if (empty($user->password_hash)) {

            if ($user->is_active) {

                $password_reset_hash = generate_random_hash();

                $reset_request_result = execute('call sp_users_password_reset_request(:p_email, :p_password_reset_hash);', array(
                    array('p_email', $user->email, PDO::PARAM_STR),
                    array('p_password_reset_hash', $password_reset_hash, PDO::PARAM_STR)
                ));

                $mail_sent = send_known_user_new_password_email($user->email, [
                    'nick' => $user->nick,
                    'link' => link_to(t('reset_your_password'), t('password_reset_form_slug', ['key' => $reset_request_result->password_reset_hash]))
                ]);

                if ($mail_sent) {
                    flash('important', t('known_user_password_reset'));
                } else {
                    flash('warning', t('email_sending_problem'));
                }

            } else {

                flash('warning', t('account_inactive_please_contact'));

            }

        } elseif (password_verify($params['password'], $user->password_hash)) {

            if ($user->is_active) {

                if ($user->caretaker_check) {

                    session_regenerate_id(true);
                    $_SESSION['user_id'] = $user->id;
                    $_SESSION['role_id'] = $user->role_id;
                    $_SESSION['nick'] = $user->nick;

                    execute('call sp_user_login(:p_user_id, :p_session_id);', array(
                        array('p_user_id', $user->id, PDO::PARAM_INT),
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

            $params['errors']['login']['message'] = t('login_failure');

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

            <input id="login" type="text" name="login" placeholder="<?= t('nick_or_email') ?>" value="<?= params('login') ?>" required autofocus />
            <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" required />
            <input type="submit" value="<?= t('log_in') ?>" />

            <p>
                <?= link_to(t('forgot_password'), t('password_reset_request_slug')) ?>
            </p>
            <p>
                <?= t('no_account_yet', ['link' => link_to(t('register'), t('registration_slug'))]) ?>
            </p>

        </form>

    </div>

    <?php }

include 'layout.php';
