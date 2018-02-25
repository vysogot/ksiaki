<?php

namespace App\Models\Factories;

use Core\DatabaseFactory;
use App\Models\ScoreGame as Model;

class ScoreGame extends DatabaseFactory
{

  public static function create($new)
  {
    var_dump($new);
    return self::execute('call sp_score_games_create(
      :p_user_id,
      :p_contest_id,
      :p_level,
      :p_begins_at,
      :p_ends_at,
      :p_points,
      :p_points_total
    );', array(
      array('p_user_id', $new->user_id, 'int'),
      array('p_contest_id', $new->contest_id, 'int'),
      array('p_level', $new->level, 'int'),
      array('p_begins_at', $new->begins_at->format('Y-m-d H:i:s'), 'str'),
      array('p_ends_at', $new->ends_at->format('Y-m-d H:i:s'), 'str'),
      array('p_points', $new->points, 'int'),
      array('p_points_total', $new->points_total, 'int')
    ));

    return ($result->rowCount == 1);
  }

}
