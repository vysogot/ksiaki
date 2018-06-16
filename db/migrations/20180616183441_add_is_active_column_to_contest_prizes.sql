DELIMITER $$

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-16 18:34:41');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    ALTER TABLE `_contest_prizes` ADD `is_active` TINYINT(1) NOT NULL DEFAULT 1 AFTER `image_url`;

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

$$
DELIMITER ;
