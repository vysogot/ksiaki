DELIMITER $$

DROP PROCEDURE IF EXISTS insert_new_game_memory $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE insert_new_game_memory()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-08 09:04:00');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    INSERT INTO `def_games` (`name`, `description`)
    VALUES
    ('memory', 'memory_description');

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
CALL insert_new_game_memory() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS insert_new_game_memory $$

DELIMITER ;