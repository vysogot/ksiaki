<?php

include 'init.php';

$params = [
    'name' => null,
    'email' => null,
    'birthday' => null,
    'caretaker_email' => null,
    'terms_and_conditions' => null,
    'password' => null
];

if ($post) {

    $params = array_merge($params, $_POST);

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

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/assets/js/calendar-pl.js"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">


    <form method="post" action="/register.php" id="register" class="vertical-form" accept-charset="UTF-8">

        <legend><h2><?= t('register') ?></h2></legend>

        <input id="name" type="text" name="name" placeholder="<?= t('name') ?>" value="<?= $params['name'] ?>" required autofocus />
        <input id="email" type="email" placeholder="<?= t('email') ?>" name="email" value="<?= $params['email'] ?>" required />
        <input id="birthday" type="text" placeholder="<?= t('birthday') ?>" name="birthday" value="<?= $params['birthday'] ?>" required />
        <input class="hidden" id="caretaker_email" type="email" placeholder="<?= t('caretaker_email') ?>" name="caretaker_email" value="<?= $params['caretaker_email'] ?>" />
        <input id="password" type="password" placeholder="<?= t('password') ?>" name="password" required />
<div>
    <input id="terms_and_conditions" type="checkbox" name="terms_and_conditions" value="1" <?php if ($params['terms_and_conditions'] == 1) echo "checked" ?> required />
    <label for="terms_and_conditions"><?= t('terms_and_conditions') ?></label>
    <input type="hidden" name="terms_and_conditions" value="0">
  </div>

        <input type="submit" value="<?= t('sign_up') ?>" />

        <p><a href="/login.php"><?= t('login') ?></a></p>

    </form>

    <script>
    $(document).on('ready', function() {
        function caretaker() {
            birthday_string = $('#birthday').val();
            if (/\d{2}\.\d{2}.\d{4}/.test(birthday_string)) {
                var parts = birthday_string.split('.');
                var birthday = new Date(parts[2], parts[1] - 1, parts[0]);
                var today = new Date();
                var back18years = today.setFullYear(today.getFullYear() - 18);
                if (birthday > back18years) {
                    $('#caretaker_email').removeClass('hidden'); 
                    $("#caretaker_email").prop('required', true);
                } else {
                    $('#caretaker_email').addClass('hidden'); 
                    $("#caretaker_email").prop('required', false);
                }
            }
        }

        caretaker();

        $("#birthday").datepicker({
        changeMonth: true,
            changeYear: true,
            maxDate: "0D",
            yearRange: "c-99:n+0"
        });


        $( "#birthday" ).on('change', function() {
            caretaker(); 
        }); 
    });
    </script>

</div>

<?php }

include 'layout.php';
