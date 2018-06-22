DELIMITER $$

DROP PROCEDURE IF EXISTS create_mail_templates_table $$

-- Create the stored procedure to perform the migration
CREATE PROCEDURE create_mail_templates_table()

BEGIN

SET @last_migration_at = (SELECT last_migration_at FROM schema_version);
SET @migration_timestamp = TIMESTAMP('2018-06-20 18:36:41');

IF (@last_migration_at < @migration_timestamp) THEN

    /*** BEGINING OF MIGRATION ***/

    CREATE TABLE `def_mail_templates` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
      `content` text COLLATE utf8_polish_ci DEFAULT NULL,
      `updated_at` datetime DEFAULT NULL,
      `updated_by` int(10) DEFAULT 0,
      PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Szablony maili';

  INSERT INTO `def_mail_templates` (`name`, `subject`, `content`)
  VALUES
  ('registration', 'registration', 'content <p>{{link}}</p>'),
  ('registration_for_caretaker', 'registration_for_caretaker', 'content <p>{{link}}</p>'),
  ('password_reset', 'password_reset', 'content <p>{{link}}</p>'),
  ('account_deactivation', 'account_deactivation', 'content <p>{{link}}</p>'),
  ('inviting_an_outsider', '{{nick}} inviting_an_outsider', 'inviting_an_outsider <p>{{link}}</p>'),
  ('being_a_contest_laureate', 'being_a_contest_laureate', 'content <p>{{link}}</p>'),
  ('new_contest_creation', 'new_contest_creation {{contest_name}} na Konkursiaki.pl!', 'content <p>{{link}}</p>');


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
CALL create_mail_templates_table() $$

-- Don't forget to drop the stored procedure when you're done!
DROP PROCEDURE IF EXISTS create_mail_templates_table $$

DELIMITER ;
