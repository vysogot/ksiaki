<?php

class Config
{
    // this is public to allow better Unit Testing
    public static $config;

    public static function get($key)
    {
        if (!self::$config) {
        
            //echo realpath(dirname(__FILE__)) . '/application/config/config.' . Environment::get() . '.php';
            //echo '../application/config/config.' . Environment::get() . '.php';

            $config_file = '../application/config/config.' . Environment::get() . '.php';

            if (!file_exists($config_file)) {
                return false;
            }

            self::$config = require $config_file;
        }

        return self::$config[$key];
    }
}
