-- Zrzut struktury procedura ksiaki.sp_createNote
DELIMITER //
CREATE PROCEDURE `sp_createNote`(IN `p_note_text` TEXT, IN `p_user_id` INT)
BEGIN
INSERT INTO notes (note_text, user_id) VALUES (p_note_text, p_user_id);
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_deleteAvatar
DELIMITER //
CREATE PROCEDURE `sp_deleteAvatar`(IN `p_user_id` INT)
BEGIN
UPDATE users 
SET user_has_avatar = 0 
WHERE (user_id = p_user_id)
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_deleteNote
DELIMITER //
CREATE PROCEDURE `sp_deleteNote`(IN `p_note_id` INT, IN `p_user_id` INT)
BEGIN
DELETE FROM notes 
WHERE (note_id = p_note_id) 
AND (user_id = p_user_id) 
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getAllNotes
DELIMITER //
CREATE PROCEDURE `sp_getAllNotes`(IN `p_user_id` INT)
BEGIN
SELECT user_id
, note_id
, note_text 
FROM notes 
WHERE (user_id = p_user_id);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getNote
DELIMITER //
CREATE PROCEDURE `sp_getNote`(IN `p_user_id` INT, IN `p_note_id` INT)
BEGIN
SELECT user_id
, note_id
, note_text 
FROM notes 
WHERE (user_id = p_user_id)
AND (note_id = p_note_id) 
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getPublicProfileOfUser
DELIMITER //
CREATE PROCEDURE `sp_getPublicProfileOfUser`(IN `p_user_id` INT)
BEGIN
SELECT user_id
, user_name
, user_email
, user_active
, user_has_avatar
, user_deleted
FROM users 
WHERE (user_id = p_user_id)
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getPublicProfilesOfAllUsers
DELIMITER //
CREATE PROCEDURE `sp_getPublicProfilesOfAllUsers`()
BEGIN
SELECT user_id
, user_name
, user_email
, user_active
, user_has_avatar
, user_deleted 
FROM users;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getPublicUserAvatarFilePathByUserId
DELIMITER //
CREATE PROCEDURE `sp_getPublicUserAvatarFilePathByUserId`(IN `p_user_id` INT)
BEGIN
SELECT user_has_avatar 
FROM users 
WHERE (user_id = p_user_id)
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getUserDataByUserIdAndToken
DELIMITER //
CREATE PROCEDURE `sp_getUserDataByUserIdAndToken`(IN `p_user_id` INT, IN `p_user_remember_me_token` VARCHAR(64), IN `p_provider_type` VARCHAR(50))
BEGIN
SELECT user_id
, user_name
, user_email
, user_password_hash
, user_active
, user_account_type
, user_has_avatar
, user_failed_logins
, user_last_failed_login
FROM users
WHERE (user_id = p_user_id)
AND (user_remember_me_token = p_user_remember_me_token)
AND user_remember_me_token IS NOT NULL
AND (user_provider_type = p_provider_type)
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_getUserDataByUsername
DELIMITER //
CREATE PROCEDURE `sp_getUserDataByUsername`(IN `p_user_name` VARCHAR(50), IN `p_provider_type` VARCHAR(50))
BEGIN
SELECT user_id
, user_name
, user_email
, user_password_hash
, user_active
,user_deleted
, user_suspension_timestamp
, user_account_type
, user_failed_logins
, user_last_failed_login
FROM users
WHERE (user_name = p_user_name OR user_email = p_user_name)
AND (user_provider_type = p_provider_type)
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_isConcurrentSessionExists
DELIMITER //
CREATE PROCEDURE `sp_isConcurrentSessionExists`(IN `p_user_id` INT)
BEGIN
SELECT session_id 
FROM users 
WHERE (user_id = p_user_id) 
LIMIT 1;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_saveTimestampOfLoginOfUser
DELIMITER //
CREATE PROCEDURE `sp_saveTimestampOfLoginOfUser`(IN `p_user_name` VARCHAR(50))
BEGIN
UPDATE users
SET user_last_login_timestamp = UNIX_TIMESTAMP()
WHERE (user_name = p_user_name)
LIMIT 1;
SELECT ROW_COUNT() AS ret;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_updateNote
DELIMITER //
CREATE PROCEDURE `sp_updateNote`(IN `p_note_id` INT, IN `p_user_id` INT, IN `p_note_text` TEXT)
BEGIN
UPDATE notes 
SET note_text = p_note_text 
WHERE (note_id = p_note_id) 
AND (user_id = p_user_id) 
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_updateSessionId
DELIMITER //
CREATE PROCEDURE `sp_updateSessionId`(IN `p_user_id` INT, IN `p_session_id` VARCHAR(50))
BEGIN
UPDATE users 
SET session_id = p_session_id 
WHERE (user_id = p_user_id);
END//
DELIMITER ;


-- Zrzut struktury procedura ksiaki.sp_writeAvatarToDatabase
DELIMITER //
CREATE PROCEDURE `sp_writeAvatarToDatabase`(IN `p_user_id` INT)
BEGIN
UPDATE users 
SET user_has_avatar = TRUE 
WHERE user_id = p_user_id 
LIMIT 1;
SELECT ROW_COUNT() AS rowCount;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
