DROP PROCEDURE IF EXISTS sp_mail_templates_find;
DROP PROCEDURE IF EXISTS sp_mail_templates_all;
DROP PROCEDURE IF EXISTS sp_mail_templates_update;

DELIMITER $$
CREATE PROCEDURE `sp_mail_templates_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , name
    , subject
    , content
    FROM def_mail_templates
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_mail_templates_all`()
BEGIN
    SELECT id
    , name
    , subject
    FROM def_mail_templates;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_mail_templates_update`(
    IN `p_id` INT,
    IN `p_subject` VARCHAR(255),
    IN `p_content` text
)
BEGIN

    UPDATE _mail_templates
    SET subject = p_subject
    , content = p_content
    WHERE (id = p_id);

    CALL `sp_mail_templates_find`(p_id);

END$$
DELIMITER ;
