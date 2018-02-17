<?php

namespace App\Models;

use \PDO;
use \DateTime;
use Factories\Contest as Factory;

class Contest
{

  protected $factory;

  public function __construct($result = null)
  {
    if (empty($result)) {
      $factory = new Factory();
      $result = $factory->getNew();
    }

    setObject($result);
  }

  public static function all($options)
  {
    return $factory->getAll(
      $options["offset"], $options["limit"]
    );
  }

  public static function find($id)
  {
    return self::new($factory->getOne($id));
  }

  public static function create($params)
  {
    return $this->update($params);
  }

  public static function update($params)
  {
    $params['begins_at'] = new DateTime($params['begins_at']);
    $params['ends_at'] = new DateTime($params['ends_at']);

    $factory->set($params);

    return find($params['id']);
  }

  public static function destroy($id)
  {
    return $factory->delete($id);
  }

  private function setObject($result)
  {
    $this->id = $result->id;
    $this->game_id = $result->game_id;
    $this->contest_type_id = $result->contest_type_id;
    $this->name = $result->name;
    $this->description = $result->description;
    $this->banner_url = $result->banner_url;
    $this->display_ad = $result->display_ad;
    $this->begins_at = $result->begins_at;
    $this->ends_at = $result->ends_at;
  }
}
