DROP PROCEDURE IF EXISTS sp_user_movies_new;
DROP PROCEDURE IF EXISTS sp_user_movies_find;
DROP PROCEDURE IF EXISTS sp_user_movies_all;
DROP PROCEDURE IF EXISTS sp_user_movies_create;
DROP PROCEDURE IF EXISTS sp_user_movies_update;
DROP PROCEDURE IF EXISTS sp_user_movies_delete;
DROP PROCEDURE IF EXISTS sp_user_movies_get;
DROP PROCEDURE IF EXISTS sp_user_movies_sorted_by_likes;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_get`()
BEGIN
    SELECT image_url, link_url
    FROM _user_movies
    WHERE is_active
    AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_new`()
BEGIN
    SELECT 0 AS id
    , 0 AS user_id
    , '' AS name
    , '' AS description
    , '/uploads/user_movie-1.mp4' AS video_url
    , '/uploads/user_movie-1.jpg' AS image_url
    , 'https://konkursiaki.pl' AS link_url
    , 1 AS is_active
    , NOW() AS begins_at
    , DATE_ADD(NOW(), INTERVAL 14 DAY) AS ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_find`(IN `p_id` INT)
BEGIN
    SELECT id
    , _user_movies.user_id
    , name
    , description
    , video_url
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    , COUNT(_user_movies_likes.user_movie_id) as likes_count
    FROM _user_movies
    LEFT JOIN _user_movies_likes ON _user_movies.id = _user_movies_likes.user_movie_id
    WHERE (id = p_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_all`()
BEGIN
    SELECT id
    , user_id
    , name
    , description
    , video_url
    , image_url
    , link_url
    , is_active
    , begins_at
    , ends_at
    FROM _user_movies
    WHERE (marked_as_deleted_by = 0);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_sorted_by_likes`()
BEGIN
    SELECT id
    , user_id
    , name
    , description
    , video_url
    , image_url
    , link_url
    , IFNULL(movies_likes.likes, 0) AS likes
    FROM _user_movies AS movies
    LEFT JOIN (
        SELECT user_movie_id, SUM(1) AS likes
        FROM _user_movies_likes
        GROUP BY user_movie_id
    ) AS movies_likes ON (movies.id = movies_likes.user_movie_id)
    ORDER BY IFNULL(movies_likes.likes, 0) DESC;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_user_movies_create`(
    IN `p_user_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    INSERT INTO _user_movies(
        user_id
        , name
        , description
        , video_url
        , image_url
        , link_url
        , is_active
        , begins_at
        , ends_at
        ) VALUES(
        p_user_id,
        p_name,
        p_description,
        p_video_url,
        p_image_url,
        p_link_url,
        p_is_active,
        p_begins_at,
        p_ends_at
    );
    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_update`(
    IN `p_id` INT,
    IN `p_user_id` INT,
    IN `p_name` VARCHAR(255),
    IN `p_description` VARCHAR(255),
    IN `p_video_url` VARCHAR(255),
    IN `p_image_url` VARCHAR(255),
    IN `p_link_url` VARCHAR(255),
    IN `p_is_active` INT,
    IN `p_begins_at` DATETIME,
    IN `p_ends_at` DATETIME
)
BEGIN
    UPDATE _user_movies
    SET user_id = p_user_id
    , name = p_name
    , description = p_description
    , video_url = p_video_url
    , image_url = p_image_url
    , link_url = p_link_url
    , is_active = p_is_active
    , begins_at = p_begins_at
    , ends_at = p_ends_at
    WHERE (id = p_id);

    CALL `sp_user_movies_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_user_movies_delete`(
    IN `p_id` INT
    , IN `p_user_id` INT
)
BEGIN

    UPDATE _user_movies
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_user_id
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
