DELIMITER $$

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-16 15:25:12');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    /* Nagrody konkursów */
    CREATE TABLE IF NOT EXISTS `_sponsors` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(255) NULL DEFAULT NULL,
        `description` TEXT NULL,
        `image_url` VARCHAR(255) NULL DEFAULT NULL,
        `is_active` TINYINT(1) NULL DEFAULT 1,

        `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
        `created_by` INT(10) NULL DEFAULT 0,
        `updated_at` DATETIME NULL DEFAULT NULL,
        `updated_by` INT(10) NULL DEFAULT 0,
        `marked_as_deleted_at` DATETIME NULL DEFAULT NULL,
        `marked_as_deleted_by` INT(10) NULL DEFAULT 0,

        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Sponsorzy np. nagród konkursów';

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
