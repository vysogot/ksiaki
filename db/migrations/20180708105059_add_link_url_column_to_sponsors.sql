DELIMITER $$

DROP PROCEDURE IF EXISTS add_link_url_column_to_sponsors $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_link_url_column_to_sponsors()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-08 10:50:59');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_sponsors` ADD `link_url` VARCHAR(255) DEFAULT NULL AFTER `image_url`;

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
CALL add_link_url_column_to_sponsors() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_link_url_column_to_sponsors $$

DELIMITER ;