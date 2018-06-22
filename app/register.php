<?php

include 'init.php';
include '_validation_for_register.php';

$params = array_merge($params, $_GET);

if ($post) {

    $params = array_merge($params, $_POST);

    sanitize($params);
    validate($params);

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
                'link' => link_to('Click', '/activate.php?key=' . $result->activation_hash)
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


    <script src="/assets/js/jquery-ui.js"></script>
    <script src="/assets/js/calendar-pl.js"></script>

    <link rel="stylesheet" href="/assets/css/jquery-ui.css">

    <form method="post" action="/register.php" id="register" class="vertical-form" accept-charset="UTF-8">

        <legend><h2><?= t('register') ?></h2></legend>

        <?php include 'partials/errors.php'; ?>

        <input type="hidden" id="invitation_hash" name="invitation_hash" value="<?= params('invitation_hash') ?>" />

        <?= csrf_field() ?>

        <input id="birthday" type="text" placeholder="<?= t('birthday') ?>" name="birthday" value="<?= params('birthday'); ?>" required />

        <div class="hidden" id="caretaker_fields">
            <input id="caretaker_name" type="text" placeholder="<?= t('caretaker_name') ?>" name="caretaker_name" value="<?= params('caretaker_name') ?>" />
            <input id="caretaker_surname" type="text" placeholder="<?= t('caretaker_surname') ?>" name="caretaker_surname" value="<?= params('caretaker_surname') ?>" />
            <input id="caretaker_email" type="email" placeholder="<?= t('caretaker_email') ?>" name="caretaker_email" value="<?= params('caretaker_email') ?>" />
        </div>

        <input id="nick" type="text" name="nick" placeholder="<?= t('nick') ?>" value="<?= params('nick') ?>" required />
        <input id="email" type="email" placeholder="<?= t('email') ?>" name="email" value="<?= params('email') ?>" required />
        <div class="center">
        <label class="required"><?= t('gender') ?></label>
        <input type="radio" name="gender" id="gender_male" value="1" <?php if (params('gender') === '1') echo "checked" ?> required/>
        <label for="gender_male"><?= t('male') ?></label>
        <input type="radio" name="gender" id="gender_female" value="0" <?php if (params('gender') === '0') echo "checked" ?>/>
        <label for="gender_female"><?= t('female') ?></label>
        </div>
        <input id="name" type="text" name="name" placeholder="<?= t('name') ?>" value="<?= params('name') ?>" required  />
        <input id="surname" type="text" name="surname" placeholder="<?= t('surname') ?>" value="<?= params('surname') ?>" required  />
        <input id="address" type="text" name="address" placeholder="<?= t('address') ?>" value="<?= params('address') ?>" required  />
        <input id="postcode" type="text" name="postcode" placeholder="<?= t('postcode') ?>" value="<?= params('postcode') ?>" required  />
        <input id="city" type="text" name="city" placeholder="<?= t('city') ?>" value="<?= params('city') ?>" required  />
        <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" required />

         <div class="agreement">
            <span class="info"><strong class="required"><?= t('contest_agreement') ?></strong></span><br />
            <input type="hidden" name="contest_agreement" value="0">
            <input id="contest_agreement" type="checkbox" name="contest_agreement" value="1" <?php if (params('contest_agreement') == 1) echo "checked" ?> required />
            <label for="contest_agreement"><?= t('contest_agreement_description') ?></label>
        </div>
<div class="agreement">
            <span class="info"><strong class="required"><?= t('marketing_agreement') ?></strong></span><br />
            <input type="hidden" name="marketing_agreement" value="0">
            <input id="marketing_agreement" type="checkbox" name="marketing_agreement" value="1" <?php if (params('marketing_agreement') == 1) echo "checked" ?> />
            <label for="marketing_agreement"><?= t('marketing_agreement_description') ?></label>
        </div>

        <div class="agreement">
            <strong><span class="info"><?= t('notifications_agreement') ?></strong></span><br />
            <input type="hidden" name="notifications_agreement" value="0">
            <input id="notifications_agreement" type="checkbox" name="notifications_agreement" value="1" <?php if (params('notifications_agreement') == 1) echo "checked" ?> />
            <label for="notifications_agreement"><?= t('notifications_agreement_description') ?></label>
        </div>

        <div class="agreement">
            <span class="info"><strong class="required"><?= t('statute_agreement') ?></strong></span><br />
            <input type="hidden" name="statute_agreement" value="0">
            <input id="statute_agreement" type="checkbox" name="statute_agreement" value="1" <?php if (params('statute_agreement') == 1) echo "checked" ?> required />
            <label for="statute_agreement"><?= t('statute_agreement_description') ?></label>
        </div>

        <div class="agreement">
            <span class="info"><strong><?= t('cancellation_conditions') ?></strong></span>
            <label class="info last-info"><?= t('registration_info') ?></label>
        </div>

        <input type="submit" value="<?= t('sign_up') ?>" />

        <p><?= t('already_have_account') ?> <?= link_to(t('log_in'), '/login.php') ?></a></p>

    </form>

    <script>
    $(document).on('ready', function() {
        function toggle_caretaker_fields() {
            birthday_string = $('#birthday').val();
            if (/\d{2}\.\d{2}.\d{4}/.test(birthday_string)) {
                var parts = birthday_string.split('.');
                var birthday = new Date(parts[2], parts[1] - 1, parts[0]);
                var today = new Date();
                var back18years = today.setFullYear(today.getFullYear() - 18);
                if (birthday > back18years) {
                    $('#caretaker_fields').removeClass('hidden');
                    $("#caretaker_name").prop('required', true);
                    $("#caretaker_surname").prop('required', true);
                    $("#caretaker_email").prop('required', true);
                } else {
                    $('#caretaker_fields').addClass('hidden');
                    $("#caretaker_name").prop('required', false);
                    $("#caretaker_surname").prop('required', false);
                    $("#caretaker_email").prop('required', false);
                }
            }
        }

        toggle_caretaker_fields();

        $("#birthday").datepicker({
        changeMonth: true,
            changeYear: true,
            maxDate: "0D",
            yearRange: "c-99:n+0"
        });


        $("#birthday").on('change', function() {
            toggle_caretaker_fields();
        });
    });
</script>

</div>

<?php }

include 'layout.php';
