DROP PROCEDURE IF EXISTS sp_games_find;
DROP PROCEDURE IF EXISTS sp_games_find_by_contest_id;
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
CREATE PROCEDURE `sp_games_find_by_contest_id`(IN `p_contest_id` INT)
BEGIN
SELECT def_games.id
, def_games.name
, def_games.description
FROM def_games
INNER JOIN _contests ON _contests.id = p_contest_id
WHERE (def_games.id = _contests.game_id);
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
