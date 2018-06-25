DELIMITER $$

DROP PROCEDURE IF EXISTS add_placement_column_to_backgrounds $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_placement_column_to_backgrounds()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-25 14:23:56');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_backgrounds` ADD `placement` VARCHAR(255) DEFAULT '/' AFTER `link_url`;

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
CALL add_placement_column_to_backgrounds() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_placement_column_to_backgrounds $$

DELIMITER ;
