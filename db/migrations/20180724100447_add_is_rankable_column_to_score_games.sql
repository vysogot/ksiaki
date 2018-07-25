DELIMITER $$

DROP PROCEDURE IF EXISTS add_is_rankable_column_to_score_games $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE add_is_rankable_column_to_score_games()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-07-24 10:04:47');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `score_games` ADD `is_rankable` TINYINT(1) DEFAULT 1 AFTER `checknumber_server`;

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
CALL add_is_rankable_column_to_score_games() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS add_is_rankable_column_to_score_games $$

DELIMITER ;