<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include realpath(__DIR__ . '/phpmailer/exception.php');
include realpath(__DIR__ . '/phpmailer/phpmailer.php');
include realpath(__DIR__ . '/phpmailer/smtp.php');

function send_registration_email($to, $interpolations) {
    return send_template_email($to, 'registration', $interpolations);
}

function send_password_reset_email($to, $interpolations) {
    return send_template_email($to, 'password_reset', $interpolations);
}

function send_registration_for_caretaker_email($to, $interpolations) {
    return send_template_email($to, 'registration_for_caretaker', $interpolations);
}

function send_known_user_new_password_email($to, $interpolations) {
    return send_template_email($to, 'known_user_new_password', $interpolations);
}

function send_invitation_email($to, $interpolations) {
    return send_template_email($to, 'inviting_an_outsider', $interpolations);
}

function send_laureate_email($to, $interpolations) {
    return send_template_email($to, 'being_a_contest_laureate', $interpolations);
}

function send_template_email($to, $template_name, $interpolations) {

    $template = execute('call sp_mail_templates_find_by_name(:p_name);', [
        array('p_name', $template_name, PDO::PARAM_STR)
    ]);

    $subject = interpolate($template->subject, $interpolations);
    $body    = interpolate($template->content, $interpolations);

    return send_email($to, $subject, $body);

}

function send_email($to, $subject, $body) {

    if (getenv('APPLICATION_ENV') != 'testing') {

        $mail = new PHPMailer(true);

        try {

            if (!is_production_env()) {

                $mail->isSMTP();
                $mail->SMTPAuth = true;

                $mail->Host         = $GLOBALS['config']['smtp_host'];
                $mail->Username     = $GLOBALS['config']['smtp_username'];
                $mail->Password     = $GLOBALS['config']['smtp_password'];
                $mail->SMTPSecure   = $GLOBALS['config']['smtp_protocol'];
                $mail->Port         = $GLOBALS['config']['smtp_port'];

            }

            $mail->setFrom(
                $GLOBALS['config']['mail_from_email'],
                $GLOBALS['config']['mail_from_name']
            );

            $mail->addAddress($to);
            $mail->addReplyTo(
                $GLOBALS['config']['mail_reply_to_email'],
                $GLOBALS['config']['mail_reply_to_name']
            );

            $mail->isHTML(true);
            $mail->WordWrap = 80;
            $mail->CharSet = "UTF-8";
            $mail->Encoding = "base64";

            $mail->Subject = $subject;
            $mail->Body    = $body;

            $mail->send();

            $result = execute('call sp_log_mail_create(
                :p_email,
                :p_subject,
                :p_body,
                :p_user_id
            );', array(
                array('p_email', $to, PDO::PARAM_STR),
                array('p_subject', $subject, PDO::PARAM_STR),
                array('p_body', $body, PDO::PARAM_STR),
                array('p_user_id', current_session('user_id'), PDO::PARAM_INT)
            ));

            return true;

        } catch (Exception $e) {

            throw new Exception("Message could not be sent. Mailer Error: $mail->ErrorInfo");

        }

    }

}
