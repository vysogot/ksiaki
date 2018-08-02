DELIMITER $$

DROP PROCEDURE IF EXISTS add_position_to_heroes $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_position_to_heroes()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-08-02 13:08:48');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_heroes` ADD `position` INT(11) DEFAULT 0 AFTER `license_description`;

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
CALL add_position_to_heroes() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_position_to_heroes $$

DELIMITER ;