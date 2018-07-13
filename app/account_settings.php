<?php

include 'init.php';
include '_validation_for_account.php';

if ($get) {

    $user = fetch_one('call sp_users_find(:p_id);', [
        ['p_id', current_session('user_id'), PDO::PARAM_INT]
    ], ['fetch_type' => PDO::FETCH_ASSOC]);

    if (empty($user)) redirect('/');

    $params = $user;

    $params = array_merge($params, ['form_for' => 'account_settings']);

}

if ($post) {

    $params = [
        'gender' => null
    ];

    $params = array_merge($params, $_POST);

    sanitize($params);
    validate($params, ['for' => 'account_settings']);

    if (empty($params['errors'])) {

        $result = execute('call sp_users_update(
            :p_id,
            :p_role_id,
            :p_is_active,
            :p_birthday,
            :p_caretaker_name,
            :p_caretaker_surname,
            :p_caretaker_email,
            :p_caretaker_is_active,
            :p_nick,
            :p_email,
            :p_avatar_url,
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
            :p_caretaker_activation_hash,
            :p_updated_by
        );', array(
            array('p_id', current_session('user_id'), PDO::PARAM_INT),
            array('p_role_id', null, PDO::PARAM_INT),
            array('p_is_active', 1, PDO::PARAM_INT),
            array('p_birthday', null, PDO::PARAM_STR),
            array('p_caretaker_name', $params['caretaker_name'], PDO::PARAM_STR),
            array('p_caretaker_surname', $params['caretaker_surname'], PDO::PARAM_STR),
            array('p_caretaker_email', $params['caretaker_email'], PDO::PARAM_STR),
            array('p_caretaker_is_active', null, PDO::PARAM_INT),
            array('p_nick', $params['nick'], PDO::PARAM_STR),
            array('p_email', $params['email'], PDO::PARAM_STR),
            array('p_avatar_url', null, PDO::PARAM_STR),
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
            array('p_password_hash', '', PDO::PARAM_STR),
            array('p_caretaker_activation_hash', '', PDO::PARAM_STR),
            array('p_updated_by', current_session('user_id'), PDO::PARAM_INT)
        ));

        if (!empty($result)) {

            flash('notice', t('account_update_success'));

        } else {

            flash('warning', t('account_update_failure'));

        }

        redirect('/');
    }

}

function content($params, $data) { ?>

    <div class="wrapper">

        <form method="post" action="/account_settings.php" class="vertical-form" accept-charset="UTF-8">

            <legend>
                <h2><?= t('account_settings') ?></h2>
            </legend>

            <?php include 'partials/account_form.php' ?>

            <input type="submit" value="<?= t('update_settings') ?>" />

            <p><?= link_to(t('password_reset'), t('password_reset_request_slug')) ?></p>

        </form>

    </div>

    <?php }

include 'layout.php';
