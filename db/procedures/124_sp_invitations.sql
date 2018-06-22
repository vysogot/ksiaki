DROP PROCEDURE IF EXISTS sp_invitations_create;

DELIMITER $$
CREATE PROCEDURE `sp_invitations_create`(
    IN `p_user_id` INT,
    IN `p_email_to` VARCHAR(255),
    IN `p_invitation_hash` VARCHAR(255)
)
BEGIN

    SET @already_exists = (
        SELECT count(*) FROM _users
        WHERE (email = p_email_to)
        LIMIT 1
    );

    IF (@already_exists = 0) THEN

        INSERT INTO _invitations(
            user_id
            , email_to
            , invitation_hash
            , created_at
        ) VALUES(
            p_user_id
            , p_email_to
            , p_invitation_hash
            , NOW()
        );

    END IF;

    SELECT @already_exists AS already_exists,
    p_invitation_hash AS invitation_hash;

END$$
DELIMITER ;
