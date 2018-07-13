DELIMITER $$

DROP PROCEDURE IF EXISTS change_default_of_is_active_in_users $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE change_default_of_is_active_in_users()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-12 15:50:06');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE _users MODIFY is_active tinyint(1) DEFAULT 0;

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
CALL change_default_of_is_active_in_users() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS change_default_of_is_active_in_users $$

DELIMITER ;
