DROP PROCEDURE IF EXISTS sp_backgrounds_all;
DROP PROCEDURE IF EXISTS sp_backgrounds_get;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_get`()
BEGIN
SELECT image_url
FROM _backgrounds
WHERE is_active
AND NOW() BETWEEN begins_at AND ends_at;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_backgrounds_all`(IN `p_id` INT
  , IN `p_name` VARCHAR(255)
	, IN `p_link_url` VARCHAR(50)
	, IN `p_offset` INT
	, IN `p_limit` INT
)
BEGIN
SELECT id
, name
, image_url
, link_url
, is_active
, begins_at
, ends_at
FROM _backgrounds
WHERE id = CASE WHEN p_id IS NULL THEN id ELSE p_id END
AND name LIKE CASE WHEN p_name IS NULL THEN name ELSE '%name%' END
AND link_url LIKE CASE WHEN p_link_url IS NULL THEN link_url ELSE '%p_link_url%' END
LIMIT p_limit
OFFSET p_offset;
END$$
DELIMITER ;

SELECT 1;
