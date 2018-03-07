<?php

namespace App\Models;

use \DateTime;
use App\Models\Factories\Contest as Factory;

class Contest extends \Core\Model
{

  public function __construct($params = [])
  {
    parent::__construct($params);
  }

  protected static function new()
  {
    return Factory::new();
  }

  public static function find($id)
  {
    return Factory::find($id);
  }

  public static function all($options = [])
  {
    return Factory::all($options);
  }

  public static function save($params)
  {
    return Factory::create($params);
  }

  public static function update($params)
  {
    $params['begins_at'] = new DateTime($params['begins_at']);
    $params['ends_at'] = new DateTime($params['ends_at']);

    return Factory::update($params);
  }

  public static function destroy($id)
  {
    return Factory::delete($id);
  }
}
