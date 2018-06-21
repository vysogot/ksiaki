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
  ('registration', 'Dziękujemy za rejestrację!', 'Treść. Link: <p>{{link}}</p> Do zobaczenia!'),
  ('registration_for_caretaker', 'Twój podopieczny się zarejestrował', 'Treść. Link: <p>{{link}}</p> Do zobaczenia!'),
  ('password_reset', 'Ustaw nowe hasło', 'Treść. Link: <p>{{link}}</p> Do zobaczenia!'),
  ('account_deactivation', 'Twoje konto zostało deaktywowane', 'Treść. Link: <p>{{link}}</p> Do zobaczenia!'),
  ('inviting_an_outsider', '{{nick}} wysłał Ci zaproszenie na Konkursiaki.pl!', 'Treść. Link: <p>{{link}}</p> Do zobaczenia!'),
  ('being_a_contest_laureate', 'Gratulujemy!', 'Treść. Link do zmiany hasła: <p>{{link}}</p> Do zobaczenia!'),
  ('new_contest_creation', 'Zostałeś laureatem konkursu {{contest_name}} na Konkursiaki.pl!', 'Treść. Link do zmiany hasła: <p>{{link}}</p> Do zobaczenia!');


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
