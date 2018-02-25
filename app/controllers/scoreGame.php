<?php

namespace App\Controllers;

use \App\Models\ScoreGame as Model;

class ScoreGame extends Front
{
  public function __construct($action)
  {
    parent::__construct(self::class, $action);
  }

  public function create()
  {
    $scoreGame = new Model($_POST);

    if ($scoreGame->save()) {
      $this->renderJSON(["success" => 1]);
    } else {
      $this->renderJSON(["success" => 0]);
    }
  }
}
