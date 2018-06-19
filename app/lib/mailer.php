<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include realpath(__DIR__ . '/phpmailer/exception.php');
include realpath(__DIR__ . '/phpmailer/phpmailer.php');
include realpath(__DIR__ . '/phpmailer/smtp.php');

function send_email($to, $options = []) {

    if (getenv('APPLICATION_ENV') != 'testing') {

        $defaults = [
            'name' => 'Recipient',
            'subject' => 'A message from our service',
            'body' => 'We wish you all the best!'
        ];

        $options = array_merge($defaults, $options);

        $mail = new PHPMailer(true);

        try {

            $mail->isSMTP();
            $mail->SMTPAuth = true;

            $mail->Host         = $GLOBALS['config']['smtp_host'];
            $mail->Username     = $GLOBALS['config']['smtp_username'];
            $mail->Password     = $GLOBALS['config']['smtp_password'];
            $mail->SMTPSecure   = $GLOBALS['config']['smtp_protocol'];
            $mail->Port         = $GLOBALS['config']['smtp_port'];

            $mail->setFrom(
                $GLOBALS['config']['smtp_from_email'],
                $GLOBALS['config']['smtp_from_name']
            );

            $mail->addAddress($to, $options['name']);
            $mail->addReplyTo(
                $GLOBALS['config']['smtp_reply_to_email'],
                $GLOBALS['config']['smtp_reply_to_name']
            );

            $mail->isHTML(true);
            $mail->WordWrap = 80;
            $mail->CharSet = "UTF-8";
            $mail->Encoding = "base64";
            
            $mail->Subject = htmlentities(trim($options['subject']), ENT_NOQUOTES, 'utf-8');
            $mail->Body = trim($options['body']);

            $mail->send();

            return true;

        } catch (Exception $e) {

            throw new Exception("Message could not be sent. Mailer Error: $mail->ErrorInfo");

        }

    }

}
