<?php

include 'init.php';

$params = [
    'key' => null
];

if ($get) {

    $params = array_merge($params, $_GET);

    $result = execute('call sp_users_find_by_password_reset_hash(:p_password_reset_hash);', array(
        array('p_password_reset_hash', $params['key'], PDO::PARAM_STR)
    ));

    if (empty($result)) {
        flash('warning', t('active_password_restoration_key_not_found'));
        redirect('/');
    }

}

if ($post) {

    $params = array_merge($params, $_POST);

    if (validate_presence($params, 'key') && validate_presence($params, 'password')) {

        $new_password_hash = password_hash($params['password'], PASSWORD_DEFAULT);

        $result = execute('call sp_users_password_reset_execute(
            :p_password_reset_hash,
            :p_new_password_hash
        );', array(
            array('p_password_reset_hash', $params['key'], PDO::PARAM_STR),
            array('p_new_password_hash', $new_password_hash, PDO::PARAM_STR)
        ));

        if (!empty($result)) {

            flash('notice', t('password_reset_successful'));

        } else {

            flash('warning', t('password_reset_failed'));

        }

        redirect('/');

    }
}

function content($params, $data) { ?>

<div class="wrapper">


  <form action="<?= path_to('/password_reset_form.php') ?>" method="post" class="vertical-form">

    <legend><h2><?= t('password_reset') ?></h2></legend>

    <?php include 'partials/errors.php'; ?>

    <?= csrf_field() ?>

    <input id="key" type="hidden" name="key" value="<?= $params['key'] ?>" />
    <input id="password" type="password" name="password" placeholder="<?= t('password') ?>" autofocus required />
    <input type="submit" value="<?= t('submit') ?>"/>

  </form>

</div>

<?php }

include 'layout.php';
