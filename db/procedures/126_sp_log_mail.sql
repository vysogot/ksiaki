DROP PROCEDURE IF EXISTS sp_log_mail_create;
DROP PROCEDURE IF EXISTS sp_log_mail_all_count;
DROP PROCEDURE IF EXISTS sp_log_mail_all;
DROP PROCEDURE IF EXISTS sp_log_mail_find;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_create`(
    IN `p_email` VARCHAR(255)
    , IN `p_subject` VARCHAR(255)
    , IN `p_body` text
    , IN `p_user_id` INT
)
BEGIN

    INSERT INTO log_mail(
        email
        , subject
        , body
        , created_at
        , created_by
    ) VALUES(
        p_email
        , p_subject
        , p_body
        , NOW()
        , p_user_id
    );

    SELECT ROW_COUNT() AS rowCount, LAST_INSERT_ID() AS lastInsertId;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_find`(
    IN `p_id` INT
)    
BEGIN

    SELECT id
        , email
        , subject
        , body
        , created_at
        , created_by
    FROM log_mail 
    WHERE (id = p_id)
    LIMIT 1;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_all_count`(
    IN `p_search` VARCHAR(255)
)
BEGIN

    SET @search =
        CASE WHEN LOCATE('%', p_search) = 0 THEN CONCAT('%', UPPER(p_search), '%')
        ELSE UPPER(p_search) END;

    SET @recordsTotal = (SELECT SUM(1) FROM log_mail);

    SELECT @recordsTotal AS recordsTotal
    , COUNT(*) AS recordsFiltered
    FROM log_mail
    LEFT JOIN _users ON (log_mail.created_by = _users.id)
    WHERE ( (UPPER(log_mail.email) LIKE @search)
         OR (UPPER(log_mail.subject) LIKE @search)
         OR (UPPER(log_mail.body) LIKE @search)
         OR (log_mail.created_at LIKE @search)
         OR (_users.nick LIKE @search)
    );

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_log_mail_all`(
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
    
    SELECT log_mail.id
        , log_mail.email
        , log_mail.subject
        , log_mail.body
        , log_mail.created_at
        , _users.nick
    FROM log_mail
    LEFT JOIN _users ON (log_mail.created_by = _users.id)
    WHERE ( (UPPER(log_mail.email) LIKE @search)
        OR (UPPER(log_mail.subject) LIKE @search)
        OR (UPPER(log_mail.body) LIKE @search)
        OR (log_mail.created_at LIKE @search)
        OR (_users.nick LIKE @search)
    )

    ORDER BY

   CASE WHEN p_ordercolumn = 'id' AND p_orderdir = 'desc' THEN log_mail.id END DESC,
   CASE WHEN p_ordercolumn = 'id' THEN log_mail.id END,

   CASE WHEN p_ordercolumn = 'nick' AND p_orderdir = 'desc' THEN UPPER(_users.nick) END DESC,
   CASE WHEN p_ordercolumn = 'nick' THEN UPPER(_users.nick) END,

   CASE WHEN p_ordercolumn = 'email' AND p_orderdir = 'desc' THEN UPPER(log_mail.email) END DESC,
   CASE WHEN p_ordercolumn = 'email' THEN UPPER(log_mail.email) END,
   
   CASE WHEN p_ordercolumn = 'subject' AND p_orderdir = 'desc' THEN UPPER(log_mail.subject) END DESC,
   CASE WHEN p_ordercolumn = 'subject' THEN UPPER(log_mail.subject) END,

   CASE  WHEN p_ordercolumn = 'body' AND p_orderdir = 'desc' THEN UPPER(log_mail.body) END DESC,
   CASE WHEN p_ordercolumn = 'body' THEN UPPER(log_mail.body) END,
   
   CASE WHEN p_ordercolumn = 'created_at' AND p_orderdir = 'desc' THEN log_mail.created_at END DESC,
   CASE WHEN p_ordercolumn = 'created_at' THEN log_mail.created_at END,

   CASE WHEN p_ordercolumn = '' THEN log_mail.id END DESC

   LIMIT p_limit
   OFFSET p_offset;

END$$
DELIMITER ;