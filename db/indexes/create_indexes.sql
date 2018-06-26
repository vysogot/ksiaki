
CALL sp_drop_index_if_exists('old_score_total', 'idx_user_id');
CALL sp_drop_index_if_exists('old_score_total', 'idx_given_at');
CALL sp_drop_index_if_exists('old_user_contests', 'idx_user_id');
CALL sp_drop_index_if_exists('old_contests', 'idx_cid');

CALL sp_drop_index_if_exists('score_contests', 'idx_user_id');

CALL sp_drop_index_if_exists('score_pointed_activities', 'idx_user_id');

CALL sp_drop_index_if_exists('score_games', 'idx_user_id');
CALL sp_drop_index_if_exists('score_games', 'idx_contest_id');

CALL sp_drop_index_if_exists('_user_badges', 'idx_user_id');
CALL sp_drop_index_if_exists('_user_logins', 'idx_user_id');
CALL sp_drop_index_if_exists('_accounts', 'idx_user_id');
CALL sp_drop_index_if_exists('_caretakers', 'idx_user_id');


CREATE INDEX idx_user_id  ON old_score_total (user_id);
CREATE INDEX idx_given_at ON old_score_total (given_at);

CREATE INDEX idx_user_id ON old_user_contests (user_id);

CREATE INDEX idx_user_id ON score_contests (user_id);

CREATE UNIQUE INDEX idx_cid ON old_contests (cid);

CREATE INDEX idx_user_id ON score_pointed_activities (user_id);

CREATE INDEX idx_user_id ON score_games (user_id);
CREATE INDEX idx_contest_id ON score_games (contest_id);

CREATE INDEX idx_user_id ON _user_badges (user_id);

CREATE INDEX idx_user_id ON _user_logins (user_id);

CREATE INDEX idx_user_id ON _accounts (user_id);

CREATE INDEX idx_user_id ON _caretakers (user_id);




