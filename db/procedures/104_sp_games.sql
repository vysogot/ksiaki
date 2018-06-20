DROP PROCEDURE IF EXISTS sp_games_find;
DROP PROCEDURE IF EXISTS sp_games_all;

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

DELIMITER $$
CREATE PROCEDURE `sp_games_all`()
BEGIN
SELECT id
, name
, description
FROM def_games;
END$$
DELIMITER ;
