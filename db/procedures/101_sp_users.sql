DROP PROCEDURE IF EXISTS sp_users_all;
DROP PROCEDURE IF EXISTS sp_users_all_count;
DROP PROCEDURE IF EXISTS sp_users_new;
DROP PROCEDURE IF EXISTS sp_users_find;
DROP PROCEDURE IF EXISTS sp_users_find_by_nick_or_email;
DROP PROCEDURE IF EXISTS sp_users_find_by_email;
DROP PROCEDURE IF EXISTS sp_users_find_by_password_reset_hash;
DROP PROCEDURE IF EXISTS sp_users_find_all;
DROP PROCEDURE IF EXISTS sp_users_create;
DROP PROCEDURE IF EXISTS sp_users_update;
DROP PROCEDURE IF EXISTS sp_users_delete;
DROP PROCEDURE IF EXISTS sp_users_register;
DROP PROCEDURE IF EXISTS sp_users_activate;
DROP PROCEDURE IF EXISTS sp_users_caretaker_activate;
DROP PROCEDURE IF EXISTS sp_users_password_reset_request;
DROP PROCEDURE IF EXISTS sp_users_password_reset_execute;


DELIMITER $$
CREATE PROCEDURE `sp_users_new`()
BEGIN
    SELECT 0 AS id
    , 1 AS role_id
    , '' AS name
    , '' AS email
    , '' AS avatar_url
    , 1 AS is_active;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find` (
    IN `p_id` INT
)
BEGIN
    SELECT * FROM _users
    WHERE (id = p_id)
    LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_by_nick_or_email` (
    IN `p_login` VARCHAR(255)
)
BEGIN
    SELECT _users.id
    , _users.is_active
    , _users.email
    , _users.name
    , _users.surname
    , role_id
    , password_hash
    , IFNULL(_caretakers.is_active, 1) AS caretaker_check FROM _users
    LEFT JOIN _caretakers ON _users.id = _caretakers.user_id
    WHERE (_users.nick = p_login OR _users.email = p_login)
    LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_by_email` (
    IN `p_email` VARCHAR(255)
)
BEGIN
    SELECT id, is_active, name, surname FROM _users
    WHERE (email = p_email)
    LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_find_by_password_reset_hash` (
    IN `p_password_reset_hash` VARCHAR(255)
)
BEGIN
    SELECT id, is_active FROM _users
    WHERE (password_reset_hash = p_password_reset_hash)
    LIMIT 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_all` (
    IN `p_offset` INT
    , IN `p_limit` INT
    , IN `p_search` VARCHAR(50)
    , in `p_ordercolumn` VARCHAR(50)
    , in `p_orderdir` VARCHAR(50)
)
BEGIN
	 SET @search =
	 	CASE WHEN LOCATE('%', p_search) = 0 THEN CONCAT('%', UPPER(p_search), '%')
		ELSE UPPER(p_search) END;

    SELECT id
	 , nick
	 , name
	 , surname
	 , email
	 , last_login_at
	 , is_active
	 FROM _users
   WHERE (marked_as_deleted_by = 0)
   AND (
		 (UPPER(nick) LIKE @search)
     OR (id = p_search)
		 OR (UPPER(email) LIKE @search)
		 OR (UPPER(name) LIKE @search)
		 OR (UPPER(surname) LIKE @search)
    )

	 ORDER BY

	 CASE WHEN p_ordercolumn = 'id' AND p_orderdir = 'desc' THEN id END DESC,
   CASE WHEN p_ordercolumn = 'id' THEN id END,

   CASE	WHEN p_ordercolumn = 'nick' AND p_orderdir = 'desc' THEN UPPER(nick) END DESC,
   CASE	WHEN p_ordercolumn = 'nick' THEN UPPER(nick) END,

   CASE	WHEN p_ordercolumn = 'name' AND p_orderdir = 'desc' THEN UPPER(name) END DESC,
   CASE	WHEN p_ordercolumn = 'name' THEN UPPER(name) END,

   CASE	WHEN p_ordercolumn = 'surname' AND p_orderdir = 'desc' THEN UPPER(surname) END DESC,
   CASE	WHEN p_ordercolumn = 'surname' THEN UPPER(surname) END,

   CASE	WHEN p_ordercolumn = 'email' AND p_orderdir = 'desc' THEN UPPER(email) END DESC,
   CASE	WHEN p_ordercolumn = 'email' THEN UPPER(email) END,

   CASE	WHEN p_ordercolumn = 'last_login_at' AND p_orderdir = 'desc' THEN last_login_at END DESC,
   CASE	WHEN p_ordercolumn = 'last_login_at' THEN last_login_at END,

   CASE	WHEN p_ordercolumn = 'is_active' AND p_orderdir = 'desc' THEN is_active END DESC,
   CASE	WHEN p_ordercolumn = 'is_active' THEN is_active END,


   CASE WHEN p_ordercolumn = '' THEN UPPER(nick) END

   LIMIT p_limit
   OFFSET p_offset;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_all_count`(IN `p_search` VARCHAR(50))
BEGIN
	SET @search =
	 	CASE WHEN LOCATE('%', p_search) = 0 THEN CONCAT('%', UPPER(p_search), '%')
		ELSE UPPER(p_search) END;

	SET @recordsTotal = (SELECT SUM(1) FROM _users WHERE (marked_as_deleted_by = 0));

	SELECT @recordsTotal AS recordsTotal
	, SUM(1) AS recordsFiltered
	FROM _users
	WHERE (marked_as_deleted_by = 0)
   AND (
		(UPPER(nick) LIKE @search)
		 OR (UPPER(email) LIKE @search)
		 OR (UPPER(name) LIKE @search)
		 OR (UPPER(surname) LIKE @search)
    );
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_create`(
    IN `p_role_id` INT
    , IN `p_nick` VARCHAR(255)
    , IN `p_name` VARCHAR(255)
    , IN `p_email` VARCHAR(255)
    , IN `p_avatar_url` VARCHAR(255)
    , IN `p_is_active` VARCHAR(255)
    , IN `p_password_hash` VARCHAR(255)
    , IN `p_created_by` INT
)
BEGIN
    INSERT INTO _users(
        role_id
        , nick
        , name
        , email
        , avatar_url
        , is_active
        , password_hash
        , created_by
    )
    VALUES (
        p_role_id
        , p_nick
        , p_name
        , p_email
        , p_avatar_url
        , p_is_active
        , p_password_hash
        , p_created_by
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_register`(
    IN `p_birthday` date,
    IN `p_caretaker_name` VARCHAR(255),
    IN `p_caretaker_surname` VARCHAR(255),
    IN `p_caretaker_email` VARCHAR(255),
    IN `p_nick` VARCHAR(255),
    IN `p_email` VARCHAR(255),
    IN `p_gender` tinyint(1),
    IN `p_name` VARCHAR(255),
    IN `p_surname` VARCHAR(255),
    IN `p_address` VARCHAR(255),
    IN `p_postcode` VARCHAR(255),
    IN `p_city` VARCHAR(255),
    IN `p_contest_agreement` tinyint(1),
    IN `p_marketing_agreement` tinyint(1),
    IN `p_notifications_agreement` tinyint(1),
    IN `p_statute_agreement` tinyint(1),
    IN `p_password_hash` VARCHAR(255),
    IN `p_activation_hash` VARCHAR(255),
    IN `p_caretaker_activation_hash` VARCHAR(255)
)

BEGIN

    INSERT INTO _users(
        nick
        , email
        , name
        , surname
        , password_hash
        , activation_hash
    ) VALUES (
        p_nick
        , p_email
        , p_name
        , p_surname
        , p_password_hash
        , p_activation_hash
    );

    SET @last_insert_user_id = (
        SELECT LAST_INSERT_ID()
    );

    INSERT INTO _accounts(
        user_id
        , gender
        , birthday
        , address
        , postcode
        , city
        , contest_agreement
        , marketing_agreement
        , notifications_agreement
        , statute_agreement
    ) VALUES (
        @last_insert_user_id
        , p_gender
        , p_birthday
        , p_address
        , p_postcode
        , p_city
        , p_contest_agreement
        , p_marketing_agreement
        , p_notifications_agreement
        , p_statute_agreement
    );

    IF (p_caretaker_activation_hash != '') THEN
        INSERT INTO _caretakers (
            user_id
            , name
            , surname
            , email
            , activation_hash
        ) VALUES (
            @last_insert_user_id
            , p_caretaker_name
            , p_caretaker_surname
            , p_caretaker_email
            , p_caretaker_activation_hash
        );
    END IF;

    SELECT @last_insert_user_id AS lastInsertId,
    p_activation_hash AS activation_hash,
    p_caretaker_activation_hash AS caretaker_activation_hash;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_activate` (
    IN `p_activation_hash` VARCHAR(255)
)
BEGIN

    UPDATE _users
    SET is_active = 1
    , activation_hash = NULL
    , activated_at = NOW()
    WHERE (activation_hash = p_activation_hash)
    AND (is_active = 0);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_caretaker_activate` (
    IN `p_activation_hash` VARCHAR(255)
)
BEGIN

    UPDATE _caretakers
    SET is_active = 1
    , activation_hash = NULL
    , activated_at = NOW()
    WHERE (activation_hash = p_activation_hash)
    AND (is_active = 0);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_password_reset_request` (
    IN `p_email` VARCHAR(255)
    , IN `p_password_reset_hash` VARCHAR(255)
)
BEGIN

    UPDATE _users
    SET password_reset_hash = p_password_reset_hash
    , password_reset_expires_at = DATE_ADD(NOW(), INTERVAL 3 DAY)
    , updated_at = NOW()
    WHERE (email = p_email);

    SELECT ROW_COUNT() AS rowCount, p_password_reset_hash AS password_reset_hash;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_password_reset_execute` (
    IN `p_password_reset_hash` VARCHAR(255)
    , IN `p_new_password_hash` VARCHAR(255)
)
BEGIN

    UPDATE _users
    SET password_reset_hash = NULL
    , password_reset_expires_at = NULL
    , password_hash = p_new_password_hash
    , updated_at = NOW()
    WHERE (password_reset_hash = p_password_reset_hash)
    AND (password_reset_expires_at > NOW());

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_update`(
    IN `p_id` INT
    , IN `p_role_id` INT
    , IN `p_nick` VARCHAR(255)
    , IN `p_name` VARCHAR(255)
    , IN `p_email` VARCHAR(255)
    , IN `p_avatar_url` VARCHAR(255)
    , IN `p_is_active` VARCHAR(255)
    , IN `p_updated_by` INT
)
BEGIN

    UPDATE _users
    SET name = p_name
    , role_id = p_role_id
    , nick = p_nick
    , email = p_email
    , avatar_url = p_avatar_url
    , is_active = p_is_active
    , updated_at = NOW()
    , updated_by = p_updated_by
    WHERE (id = p_id);

    CALL `sp_users_find`(p_id);

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_users_delete`(
    IN `p_id` INT
    , IN `p_marked_as_deleted_by` INT
)
BEGIN

    UPDATE _users
    SET marked_as_deleted_at = NOW()
    , marked_as_deleted_by = p_marked_as_deleted_by
    , is_active = 0
    WHERE (id = p_id);

    SELECT ROW_COUNT() AS rowCount;

END$$
DELIMITER ;
