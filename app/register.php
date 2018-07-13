<?php

include 'init.php';
include '_validation_for_account.php';

$params = [
    'form_for' => 'register'
];

$params = array_merge($params, $_GET);

if ($post) {

    $params = [
        'gender' => null
    ];

    $params = array_merge($params, $_POST);

    sanitize($params);
    validate($params, ['for' => 'register']);

    if (empty($params['errors'])) {

        $password_hash = password_hash($params['password'], PASSWORD_DEFAULT);
        $activation_hash = generate_random_hash();

        $caretaker_activation_hash = '';
        if (!is_adult(strtotime($params['birthday']))) {
          $caretaker_activation_hash = generate_random_hash();
        }

        $result = execute('call sp_users_register(
            :p_birthday,
            :p_caretaker_name,
            :p_caretaker_surname,
            :p_caretaker_email,
            :p_nick,
            :p_email,
            :p_gender,
            :p_name,
            :p_surname,
            :p_address,
            :p_postcode,
            :p_city,
            :p_contest_agreement,
            :p_marketing_agreement,
            :p_notifications_agreement,
            :p_statute_agreement,
            :p_password_hash,
            :p_activation_hash,
            :p_caretaker_activation_hash,
            :p_invitation_hash
        );', array(
            array('p_birthday', date('Y-m-d H:i:s', strtotime($params['birthday'])), PDO::PARAM_STR),
            array('p_caretaker_name', $params['caretaker_name'], PDO::PARAM_STR),
            array('p_caretaker_surname', $params['caretaker_surname'], PDO::PARAM_STR),
            array('p_caretaker_email', $params['caretaker_email'], PDO::PARAM_STR),
            array('p_nick', $params['nick'], PDO::PARAM_STR),
            array('p_email', $params['email'], PDO::PARAM_STR),
            array('p_gender', $params['gender'], PDO::PARAM_INT),
            array('p_name', $params['name'], PDO::PARAM_STR),
            array('p_surname', $params['surname'], PDO::PARAM_STR),
            array('p_address', $params['address'], PDO::PARAM_STR),
            array('p_postcode', $params['postcode'], PDO::PARAM_STR),
            array('p_city', $params['city'], PDO::PARAM_STR),
            array('p_contest_agreement', $params['contest_agreement'], PDO::PARAM_INT),
            array('p_marketing_agreement', $params['marketing_agreement'], PDO::PARAM_INT),
            array('p_notifications_agreement', $params['notifications_agreement'], PDO::PARAM_INT),
            array('p_statute_agreement', $params['statute_agreement'], PDO::PARAM_INT),
            array('p_password_hash', $password_hash, PDO::PARAM_STR),
            array('p_activation_hash', $activation_hash, PDO::PARAM_STR),
            array('p_caretaker_activation_hash', $caretaker_activation_hash, PDO::PARAM_STR),
            array('p_invitation_hash', params('invitation_hash'), PDO::PARAM_STR)
        ));

        if (!empty($result)) {

            flash('notice', t('registration_success'));

            $mail_sent = send_registration_email($params['email'], [
                'nick' => $params['nick'],
                'activation_link' => link_to(t('activate_your_account'), t('account_activation_slug', ['key' => $result->activation_hash])),
                'password_reset_link' => link_to(t('reset_your_password'), t('password_reset_request_slug'))
            ]);

            if ($mail_sent) {
                flash('important', t('registration_email_sent'));
            } else {
                flash('warning', t('email_sending_problem'));
            }

            if ($params['caretaker_email']) {

                $mail_sent = send_registration_for_caretaker_email($params['caretaker_email'], [
                    'nick' => $params['nick'],
                    'link' => link_to('Click', '/caretaker_activate.php?key=' . $result->caretaker_activation_hash),
                    'caretaker_name' => $params['caretaker_name'] . ' ' . $params['caretaker_surname']
                ]);

                if ($mail_sent) {
                    flash('important', t('caretaker_email_sent'));
                } else {
                    flash('warning', t('email_sending_problem'));
                }

            }

        } else {

            flash('warning', t('registration_failure'));

        }

        redirect('/');
    }

}

function content($params, $data) { ?>

    <div class="wrapper">

        <form method="post" action="/register.php" id="register" class="vertical-form" accept-charset="UTF-8">

            <legend>
                <h2><?= t('register') ?></h2>
            </legend>

            <input type="hidden" id="invitation_hash" name="invitation_hash" value="<?= params('invitation_hash') ?>" />

            <?php include 'partials/account_form.php' ?>

            <input type="submit" value="<?= t('sign_up') ?>" />

            <p>
                <?= t('already_have_account') ?> <?= link_to(t('log_in'), t('login_slug')) ?>
            </p>

        </form>

    </div>

    <?php }

include 'layout.php';
