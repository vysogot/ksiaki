DELIMITER $$

DROP PROCEDURE IF EXISTS add_sponsor_id_column_to_contest_prizes $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_sponsor_id_column_to_contest_prizes()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-16 18:48:37');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_contest_prizes` ADD `sponsor_id` INT UNSIGNED AFTER `contest_id`;

    /*** END OF MIGRATION ***/

    /***
        Leave the below unchanged, it bumbs the schema version
    ***/

    UPDATE schema_version
    SET last_migration_at = @migration_timestamp;

    SELECT 1;

ELSE

    /* skipping file */
    SELECT 2;

END IF;

END $$

-- Execute the stored procedure
CALL add_sponsor_id_column_to_contest_prizes() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_sponsor_id_column_to_contest_prizes $$

DELIMITER ;
