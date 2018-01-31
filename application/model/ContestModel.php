<?php

/**
 * ContestModel
 */
class ContestModel
{

  public static function getContest($id)
  {
    return DatabaseFactory::getFactory()->queryExecute('call sp_getContest(:p_id);', array(
      array('p_id', $id, PDO::PARAM_INT)
    ));
  }
  
  public static function updateContest($contest_id, $contest_game_id, $contest_contest_type_id, $contest_name, $contest_description, $contest_banner_url, $contest_begins_at, $contest_ends_at)
    {
        //if (!$contest_id) {
        //    return false;
        //}
        
        $date_begins_at = new DateTime($contest_begins_at);
        $date_ends_at = new DateTime($contest_ends_at);
        
        $query = DatabaseFactory::getFactory()->queryExecute('call sp_updateContest(:p_id, :p_game_id, :p_contest_type_id, :p_name, :p_description, :p_banner_url, :p_begins_at, :p_ends_at);', array(
              array('p_id', $contest_id, PDO::PARAM_INT)
              , array('p_game_id', $contest_game_id, PDO::PARAM_INT)
              , array('p_contest_type_id', $contest_contest_type_id, PDO::PARAM_INT)
              , array('p_name', $contest_name, PDO::PARAM_STR)
              , array('p_description', $contest_description, PDO::PARAM_STR)
              , array('p_banner_url', $contest_banner_url, PDO::PARAM_STR)
              , array('p_begins_at', $date_begins_at->format('Y-m-d H:i:s'), PDO::PARAM_STR)
              , array('p_ends_at', $date_ends_at->format('Y-m-d H:i:s'), PDO::PARAM_STR)
              ));
        
        if ($query->rowCount == 1) {
            return true;
        }

        Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_EDITING_FAILED'));
        
        return false;
    }
    
    public static function deleteContest($id)
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

        // default return
        Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_DELETION_FAILED'));
        return false;
    }

}