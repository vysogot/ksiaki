DELIMITER $$

DROP PROCEDURE IF EXISTS split_heroes_and_create_magazines_table $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE split_heroes_and_create_magazines_table()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-27 16:06:56');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `_hero_editions` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `hero_id` int(10) unsigned NOT NULL,
      `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `description` text COLLATE utf8_polish_ci DEFAULT NULL,
      `cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `video_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `video_cover_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `gadget_url` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `is_active` tinyint(1) DEFAULT 1,
      `created_at` timestamp NULL DEFAULT current_timestamp(),
      `created_by` int(10) DEFAULT 0,
      `updated_at` datetime DEFAULT NULL,
      `updated_by` int(10) DEFAULT 0,
      `marked_as_deleted_at` datetime DEFAULT NULL,
      `marked_as_deleted_by` int(10) DEFAULT 0,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Edycje bohaterów';

    INSERT INTO _hero_editions (
        `hero_id` 
        , `name`
        , `description`
        , `cover_url`
        , `video_url`
        , `video_cover_url`
        , `gadget_url`
    ) SELECT 
        id
        , name
        , description
        , cover_url
        , video_url
        , video_cover_url
        , gadget_url
    FROM _heroes;

    ALTER TABLE `_heroes`
      DROP `cover_url`,
      DROP `video_url`,
      DROP `video_cover_url`,
      DROP `gadget_url`;

    ALTER TABLE `_hero_files` CHANGE `hero_id` `hero_edition_id` INT(10) UNSIGNED NOT NULL;

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
CALL split_heroes_and_create_magazines_table() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS split_heroes_and_create_magazines_table $$

DELIMITER ;