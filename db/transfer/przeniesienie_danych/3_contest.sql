select cid
, type
, TRIM(title) AS title
, FROM_UNIXTIME(start) AS start
, FROM_UNIXTIME(expire) AS expire
, game_mode
, TRIM(SUBSTRING_INDEX(top_score,':',-1)) AS top_score
from contest;