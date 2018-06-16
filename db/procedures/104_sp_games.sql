DROP PROCEDURE IF EXISTS sp_games_find;

DELIMITER $$
CREATE PROCEDURE `sp_games_find`(IN `p_id` INT)
BEGIN
SELECT id
, name
, description
FROM def_games
WHERE (id = p_id);
END$$
DELIMITER ;

SELECT 1;
