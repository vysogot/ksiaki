DROP PROCEDURE IF EXISTS sp_log_mail_create;
DROP PROCEDURE IF EXISTS sp_log_mail_all;
DROP PROCEDURE IF EXISTS sp_log_mail_find;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_create`(
    IN `p_email` VARCHAR(255)
    , IN `p_subject` VARCHAR(255)
    , IN `p_body` text
    , IN `p_user_id` INT
)
BEGIN

    INSERT INTO log_mail(
        email
        , subject
        , body
        , created_at
        , created_by
    ) VALUES(
        p_email
        , p_subject
        , p_body
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_all`()
BEGIN

    SELECT * FROM log_mail;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_find`(
    IN `p_id` INT
)
BEGIN

    SELECT * FROM log_mail WHERE id = p_id;

END$$
DELIMITER ;