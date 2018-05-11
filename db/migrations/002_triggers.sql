DELIMITER $$
CREATE TRIGGER `_heroes_after_insert` AFTER INSERT ON `_heroes` FOR EACH ROW BEGIN
DECLARE my_session_id char(32);
SET my_session_id := REPLACE(UUID(),'-','');
INSERT INTO _heroes_audit(heroe_id,name,slug,description,avatar_url,header_url,is_active,user_id,deleted,created_at,updated_at,deleted_at,session_id,update_user_id,update_action_id,update_row_type_id)
VALUES(NEW.id,NEW.name,NEW.slug,NEW.description,NEW.avatar_url,NEW.header_url,NEW.is_active,NEW.user_id,NEW.deleted,NEW.created_at,NEW.updated_at,NEW.deleted_at,my_session_id,NEW.user_id,1,2);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `_heroes_after_update` AFTER UPDATE ON `_heroes` FOR EACH ROW BEGIN
DECLARE my_session_id char(32);
SET my_session_id := REPLACE(UUID(),'-','');
INSERT INTO _heroes_audit(heroe_id,name,slug,description,avatar_url,header_url,is_active,user_id,deleted,created_at,updated_at,deleted_at,session_id,update_user_id,update_action_id,update_row_type_id)
VALUES(NEW.id,NEW.name,OLD.slug,OLD.description,OLD.avatar_url,OLD.header_url,OLD.is_active,OLD.user_id,OLD.deleted,OLD.created_at,OLD.updated_at,OLD.deleted_at,my_session_id,OLD.user_id,2,1);
INSERT INTO _heroes_audit(heroe_id,name,slug,description,avatar_url,header_url,is_active,user_id,deleted,created_at,updated_at,deleted_at,session_id,update_user_id,update_action_id,update_row_type_id)
VALUES(NEW.id,NEW.name,NEW.slug,NEW.description,NEW.avatar_url,NEW.header_url,NEW.is_active,NEW.user_id,NEW.deleted,NEW.created_at,NEW.updated_at,NEW.deleted_at,my_session_id,NEW.user_id,2,2);
END$$
DELIMITER ;

SELECT 1;
