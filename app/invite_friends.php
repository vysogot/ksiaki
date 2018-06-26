<?php

include 'init.php';

must_be_logged_in();

$params = array_merge($params, $_GET);

$invitation_template = execute('call sp_mail_templates_find_by_name(:p_name);', [
    array('p_name', 'inviting_an_outsider', PDO::PARAM_STR)
]);

$data['invitation_preview'] = interpolate($invitation_template->content, [
    'link' => link_to(t('invitation_link'), '/#', ['class' => 'no-action']),
    'nick' => $_SESSION['nick']
]);

if ($post) {

    $params = array_merge($params, $_POST);

    if (validate_email($params, 'email_to')) {

        $invitation_hash = generate_random_hash();

        $invitation_result = execute('call sp_invitations_create(
            :p_user_id,
            :p_email_to,
            :p_invitation_hash
        );', array(
            array('p_user_id', $_SESSION['user_id'], PDO::PARAM_INT),
            array('p_email_to', $params['email_to'], PDO::PARAM_STR),
            array('p_invitation_hash', $invitation_hash, PDO::PARAM_STR)
        ));

        if (!$invitation_result->already_exists) {

            flash('notice', t('invitation_successful'));

            $mail_sent = send_invitation_email($params['email_to'], [
                'nick' => $_SESSION['nick'],
                'link' => link_to(t('invitation_link'), t('invitation_registration_slug', ['invitation_hash' => $invitation_result->invitation_hash]))
            ]);

            if ($mail_sent) {
                flash('important', t('invitation_email_sent', ['email' => $params['email_to']]));
            } else {
                flash('warning', t('email_sending_problem'));
            }

            redirect('/');

        } else {

            $params['errors']['email_to']['message'] = t('invitation_failed_already_exists');

        }

    }
}

function content($params, $data) { ?>

<div class="wrapper">

  <form action="<?= path_to('/invite_friends.php') ?>" method="post" class="vertical-form">

    <legend><h2><?= t('invite_friends') ?></h2></legend>

    <?php include 'partials/errors.php'; ?>

    <?= csrf_field() ?>

    <input id="email_to" type="email" name="email_to" class="center" placeholder="<?= t('your_friends_email') ?>" autofocus required />
    <input type="submit" value="<?= t('submit') ?>"/>

    <p>
        <?= t('invitation_content_preview') ?>
    </p>

    <div class="font-fantasy">
        <?= $data['invitation_preview'] ?>
    </div>

  </form>

</div>

<?php }

include 'layout.php';
