DELIMITER $$

DROP PROCEDURE IF EXISTS change_type_column_user_logins $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE change_type_column_user_logins()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-20 09:51:27');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE _user_logins MODIFY session_id VARCHAR(255);

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
CALL change_type_column_user_logins() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS change_type_column_user_logins $$

DELIMITER ;
