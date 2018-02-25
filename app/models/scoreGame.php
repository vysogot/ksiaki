<?php

namespace App\Models;

use \DateTime;
use App\Models\Factories\ScoreGame as Factory;

class ScoreGame extends \Core\Model
{

  public function __construct($params = [])
  {

    foreach ($params as $key => $value) {
        $this->{$key} = $value;
    }

    parent::__construct($this);
  }

  public function save()
  {
    $this->begins_at = new DateTime($this->begins_at);
    $this->ends_at = new DateTime($this->ends_at);

    return Factory::create($this);
  }

}
