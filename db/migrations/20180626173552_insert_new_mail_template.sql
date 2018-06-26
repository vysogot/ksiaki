DELIMITER $$

DROP PROCEDURE IF EXISTS insert_new_mail_template $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE insert_new_mail_template()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-26 17:35:52');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    INSERT INTO `def_mail_templates` (`name`, `subject`, `content`)
    VALUES
    ('known_user_new_password', 'known_user_new_password', 'content <p>{{link}}</p>');

    /*** END OF MIGRATION ***/

    /***
        Leave the below unchanged, it bumbs the schema version
    ***/

    UPDATE schema_version
    SET last_migration_at = @migration_timestamp;

ELSE

    /* skipping file */
    SELECT 2;

END IF;

END $$

-- Execute the stored procedure
CALL insert_new_mail_template() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS insert_new_mail_template $$

DELIMITER ;
