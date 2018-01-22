<?php

/**
 * NoteModel
 * This is basically a simple CRUD (Create/Read/Update/Delete) demonstration.
 */
class NoteModel
{
    /**
     * Get all notes (notes are just example data that the user has created)
     * @return array an array with several objects (the results)
     */
    public static function getAllNotes()
    {
        return DatabaseFactory::getFactory()->queryExecute('call sp_getAllNotes(:p_user_id);'
              , array(array('p_user_id', Session::get('user_id'), PDO::PARAM_INT)), true);
    }

    /**
     * Get a single note
     * @param int $note_id id of the specific note
     * @return object a single object (the result)
     */
    public static function getNote($note_id)
    {
        return DatabaseFactory::getFactory()->queryExecute('call sp_getNote(:p_user_id, :p_note_id);', array(
              array('p_user_id', Session::get('user_id'), PDO::PARAM_INT)
              , array('p_note_id', $note_id, PDO::PARAM_INT)
              ));
    }

    /**
     * Set a note (create a new one)
     * @param string $note_text note text that will be created
     * @return bool feedback (was the note created properly ?)
     */
    public static function createNote($note_text)
    {
        if (!$note_text || strlen($note_text) == 0) {
            Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_CREATION_FAILED'));
            return false;
        }
        
        $query = DatabaseFactory::getFactory()->queryExecute('call sp_createNote(:p_note_text, :p_user_id);', array(
              array('p_note_text', $note_text, PDO::PARAM_STR)
              , array('p_user_id', Session::get('user_id'), PDO::PARAM_INT)
              ));

        if ($query->rowCount == 1) {
            return true;
        }

        // default return
        Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_CREATION_FAILED'));
        return false;
    }

    /**
     * Update an existing note
     * @param int $note_id id of the specific note
     * @param string $note_text new text of the specific note
     * @return bool feedback (was the update successful ?)
     */
    public static function updateNote($note_id, $note_text)
    {
        if (!$note_id || !$note_text) {
            return false;
        }
        
        $query = DatabaseFactory::getFactory()->queryExecute('call sp_updateNote(:p_note_id, :p_user_id, :p_note_text);', array(
              array('p_note_id', $note_id, PDO::PARAM_INT)
              , array('p_user_id', Session::get('user_id'), PDO::PARAM_INT)
              , array('p_note_text', $note_text, PDO::PARAM_STR)
              ));
        
        if ($query->rowCount == 1) {
            return true;
        }

        Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_EDITING_FAILED'));
        
        return false;
    }

    /**
     * Delete a specific note
     * @param int $note_id id of the note
     * @return bool feedback (was the note deleted properly ?)
     */
    public static function deleteNote($note_id)
    {
        if (!$note_id) {
            return false;
        }

        $query = DatabaseFactory::getFactory()->queryExecute('call sp_deleteNote(:p_note_id, :p_user_id);', array(
              array('p_note_id', $note_id, PDO::PARAM_INT)
              , array('p_user_id', Session::get('user_id'), PDO::PARAM_INT)
              ));
        

        if ($query->rowCount == 1) {
            return true;
        }

        // default return
        Session::add('feedback_negative', Text::get('FEEDBACK_NOTE_DELETION_FAILED'));
        return false;
    }
}
