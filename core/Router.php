<?php

namespace Core;

class Router
{

    const defaults = [
      'namespace' => "App\\Controllers",
      'controller' => 'home',
      'action' => 'index',
      'notfound_controller' => '\\Error',
      'notfound_action' => 'error404'
    ];

    const custom = [
      'admin' => ['controller' => 'home', 'action' => 'index']
    ];

    public $controller;
    public $action;
    public $parameters;

    public function __construct($url)
    {

        list($namespace, $controller_name, $action, $parameters) = $this->splitUrl($url);
        $controller_name = self::defaults['namespace'] . "\\$namespace" . $controller_name;

        $controller = new $controller_name($action);
        $this->parameters = $parameters;

        if (method_exists($controller, $action)) {
          $this->controller = $controller;
          $this->action = $action;
        } else {
          $error_controller_name = self::defaults['namespace'] . self::defaults['notfound_controller'];
          $this->action = self::defaults['notfound_action'];
          $this->controller = new $error_controller_name($this->action);
        }

    }

    public function dispatch()
    {
      call_user_func_array(
        array($this->controller, $this->action),
        $this->parameters
      );
    }

    private function splitUrl($url)
    {
      if (empty($url)) {
        $url = '/';
      }

      $namespace = $controller = $action = "";

      $url = trim($url, '/');
      $url = filter_var($url, FILTER_SANITIZE_URL);
      $url = array_filter(explode('/', $url));

      if (!empty($url) && !empty(self::custom[$url[0]])) {
        $namespace = array_shift($url);
        $controller = self::custom[$namespace]['controller'];
        $action = self::custom[$namespace]['action'];
        $namespace .=  '\\';
      }

      switch (count($url)) {
        case 0:
          !empty($controller)?: $controller = self::defaults['controller'];
          !empty($action)?: $action = self::defaults['action'];
          break;
        case 1:
          $controller = array_shift($url);
          !empty($action)?: $action = self::defaults['action'];
          break;
        default:
          $controller = array_shift($url);
          $action = array_shift($url);
          break;
      }

      $parameters = array_values($url);
      return [ucfirst($namespace), ucfirst($controller), $action, $parameters];
    }
}
