DROP PROCEDURE IF EXISTS sp_download_wallpaper_counter;

DELIMITER $$
CREATE PROCEDURE `sp_download_wallpaper_counter`(
	IN `p_wallpaper_id` INT
)
BEGIN
SET @is_exist = (SELECT COUNT(*) FROM download_wallpaper_counter WHERE (wallpaper_id = p_wallpaper_id));
IF (@is_exist = 0) THEN
	INSERT INTO download_wallpaper_counter(wallpaper_id) VALUES(p_wallpaper_id);
END IF;

UPDATE download_wallpaper_counter
SET counter = counter + 1
WHERE (wallpaper_id = p_wallpaper_id);

SELECT wallpaper_id 
, counter
, last_download_at
FROM download_wallpaper_counter;
END$$
DELIMITER ;
