<?php

namespace App\Models;

use \DateTime;
use App\Models\Factories\Contest as Factory;

class Contest extends \Core\Model
{

  public function __construct($params = [])
  {

    foreach ($params as $key => $value) {
        $this->{$key} = $value;
    }

    parent::__construct($this);
  }

  public static function find($id)
  {
    return Factory::find($id);
  }

  public static function all($params)
  {
    return Factory::all($params);
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
