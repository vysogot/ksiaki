DELIMITER $$

DROP PROCEDURE IF EXISTS add_statute_column_to_contests $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_statute_column_to_contests()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-19 17:05:00');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_contests` ADD `statute` TEXT AFTER `description`;

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
CALL add_statute_column_to_contests() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_statute_column_to_contests $$

DELIMITER ;
