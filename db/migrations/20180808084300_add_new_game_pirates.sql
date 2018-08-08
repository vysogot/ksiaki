DELIMITER $$

DROP PROCEDURE IF EXISTS add_new_game_pirates $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_new_game_pirates()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-08-08 08:43:00');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    INSERT INTO `def_games` (`name`, `description`)
    VALUES
    ('pirate', 'pirate_description');

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
CALL add_new_game_pirates() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_new_game_pirates $$

DELIMITER ;