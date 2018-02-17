<?php

namespace App\Models;

use \PDO;
use \DateTime;
use Core\DatabaseFactory;

class Contest
{

  public function __construct()
  {
    $contest = DatabaseFactory::getFactory()->queryExecute('call sp_getContest(:p_id);', array(
      array('p_id', 0, PDO::PARAM_INT)
    ));

    $this->id = $contest->id;
    $this->game_id = $contest->game_id;
    $this->contest_type_id = $contest->contest_type_id;
    $this->name = $contest->name;
    $this->description = $contest->description;
    $this->banner_url = $contest->banner_url;
    $this->display_ad = $contest->display_ad;
    $this->begins_at = $contest->begins_at;
    $this->ends_at = $contest->ends_at;
  }

  public static function all()
  {
    return DatabaseFactory::getFactory()->queryExecute('call sp_allContests(:p_offset, :p_limit);', array(
      array('p_offset', 0, PDO::PARAM_INT),
      array('p_limit', 50, PDO::PARAM_INT)
    ), true);
  }

  public static function find($id)
  {
    return DatabaseFactory::getFactory()->queryExecute('call sp_getContest(:p_id);', array(
      array('p_id', $id, PDO::PARAM_INT)
    ));
  }

  public static function create($params)
  {
    $this->update($params);
  }

  public static function update($params)
    {

        $params['begins_at'] = new DateTime($params['begins_at']);
        $params['ends_at'] = new DateTime($params['ends_at']);

        $query = DatabaseFactory::getFactory()->queryExecute('call sp_updateContest(
          :p_id, :p_game_id, :p_contest_type_id, :p_name, :p_description,
          :p_banner_url, :p_begins_at, :p_ends_at, :p_display_ad);', array(
              array('p_id', $params['id'], PDO::PARAM_INT)
              , array('p_game_id', $params['game_id'], PDO::PARAM_INT)
              , array('p_contest_type_id', $params['contest_type_id'], PDO::PARAM_INT)
              , array('p_name', $params['name'], PDO::PARAM_STR)
              , array('p_description', $params['description'], PDO::PARAM_STR)
              , array('p_banner_url', $params['banner_url'], PDO::PARAM_STR)
              , array('p_begins_at', $params['begins_at']->format('Y-m-d H:i:s'), PDO::PARAM_STR)
              , array('p_ends_at', $params['ends_at']->format('Y-m-d H:i:s'), PDO::PARAM_STR)
              , array('p_display_ad', $params['display_ad'], PDO::PARAM_BOOL)
              ));

        //if ($query->rowCount == 0) {
        //    Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_EDITING_FAILED'));
        //}

        return self::find($params['id']);

    }

    public static function destroy($id)
    {
        if (!$id) {
          return false;
        }

        $query = DatabaseFactory::getFactory()->queryExecute('call sp_deleteContest(:p_id);', array(
          array('p_id', $id, PDO::PARAM_INT)
        ));


        if ($query->rowCount == 1) {
            return true;
        }
    }

}
