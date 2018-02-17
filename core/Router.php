<?php

namespace Core;

class Router
{

    const defaultNamespace = "App\\Controllers";
    const customNamespaces = ['admin'];

    public $controller;
    public $action;
    public $parameters;

    public function __construct($url)
    {

        list($namespace, $controller_name, $action, $parameters) = $this->splitUrl($url);
        $controller_name = self::defaultNamespace . "\\$namespace" . $controller_name;

        $controller = new $controller_name($action);
        $this->parameters = $parameters;

        if (method_exists($controller, $action)) {
          $this->controller = $controller;
          $this->action = $action;
        } else {
          $error_controller_name = self::defaultNamespace . '\\Error';
          $this->action = 'error404';
          $this->controller = new $error_controller_name($this->action);
        }

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

      if (!empty($url) && (in_array($url[0], self::customNamespaces))) {
        $namespace = array_shift($url) . '\\';
        $controller = Config::get('DEFAULT_ADMIN_CONTROLLER');
        $action = Config::get('DEFAULT_ADMIN_ACTION');
      }

      switch (count($url)) {
        case 0:
          !empty($controller)?: $controller = Config::get('DEFAULT_CONTROLLER');
          !empty($action)?: $action = Config::get('DEFAULT_ACTION');
          break;
        case 1:
          $controller = array_shift($url);
          !empty($action)?: $action = Config::get('DEFAULT_ACTION');
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
