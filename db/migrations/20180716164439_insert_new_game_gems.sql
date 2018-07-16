DELIMITER $$

DROP PROCEDURE IF EXISTS insert_new_game_gems $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE insert_new_game_gems()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-16 16:44:39');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    INSERT INTO `def_games` (`name`, `description`)
    VALUES
    ('gems', 'gems_description');

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
CALL insert_new_game_gems() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS insert_new_game_gems $$

DELIMITER ;