DROP PROCEDURE IF EXISTS sp_user_movies_likes_create;
DROP PROCEDURE IF EXISTS sp_user_movies_likes_delete;
DROP PROCEDURE IF EXISTS sp_user_movies_likes_check;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_likes_create`(
    IN `p_user_id` INT,
    IN `p_user_movie_id` INT
)
BEGIN
    INSERT INTO _user_movies_likes(
        user_id
        , user_movie_id
        , given_at
    ) VALUES (
        p_user_id
        , p_user_movie_id
        , NOW()
    );
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_likes_delete`(
    IN `p_user_id` INT,
    IN `p_user_movie_id` INT
)
BEGIN
    DELETE FROM _user_movies_likes
    WHERE (user_id = p_user_id)
    AND (user_movie_id = p_user_movie_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_likes_check`(
    IN `p_user_id` INT,
    IN `p_user_movie_id` INT
)
BEGIN
    SELECT count(*) FROM _user_movies_likes
    WHERE (user_id = p_user_id)
    AND (user_movie_id = p_user_movie_id)
    LIMIT 1;
    SELECT ROW_COUNT() AS rowCount;
END$$
DELIMITER ;
