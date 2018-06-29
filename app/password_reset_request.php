<?php

include 'init.php';

if ($post) {

    $params = array_merge($params, $_POST);

    $user = execute('call sp_users_find_by_email(:p_email);', array(
        array('p_email', $params['email'], PDO::PARAM_STR)
    ));

    if (validate_existance($params, 'email', $user)) {

        if ($user->is_active) {

            $password_reset_hash = generate_random_hash();

            $reset_request_result = execute('call sp_users_password_reset_request(:p_email, :p_password_reset_hash);', array(
                array('p_email', $params['email'], PDO::PARAM_STR),
                array('p_password_reset_hash', $password_reset_hash, PDO::PARAM_STR)
            ));

            $mail_sent = send_password_reset_email($user->email, [
                'nick' => $user->nick,
                'link' => link_to(t('reset_your_password'), 
                    t('password_reset_form_slug', ['key' => $reset_request_result->password_reset_hash]))
            ]);

            if ($mail_sent) {
                flash('notice', t('password_restoration_email_sent'));
            } else {
                flash('warning', t('email_sending_problem'));
            }

        } else {

            flash('warning', t('account_inactive_please_contact'));

        }

        redirect('/');

    }
}

function content($params, $data) { ?>

<div class="wrapper">

  <form action="<?= path_to('/password_reset_request.php') ?>" method="post" class="vertical-form">

    <legend><h2><?= t('restore_password') ?></h2></legend>

    <?php include 'partials/errors.php'; ?>

    <?= csrf_field() ?>

    <input id="email" type="email" name="email" placeholder="<?= t('put_your_email') ?>" value="<?= params('email') ?>" autofocus required />
    <input type="submit" value="<?= t('submit') ?>"/>

    <p><?= t('no_account_yet', ['link' => link_to(t('register'), t('registration_slug'))]) ?></p>

  </form>

</div>

<?php }

include 'layout.php';
