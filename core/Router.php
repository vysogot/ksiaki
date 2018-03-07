<?php

namespace Core;
use App\Config;

class Router
{

    public $controller;
    public $action;
    public $parameters;

    public function __construct($url)
    {

        list($namespace, $controller_name, $action, $parameters) = $this->splitUrl($url);
        $controller_name = $namespace . $controller_name;

        $controller = new $controller_name($action);
        $this->parameters = $parameters;

        if (method_exists($controller, $action)) {
          $this->controller = $controller;
          $this->action = $action;
        } else {
          $error_controller_name = Config::rootNamespace . Config::rootNamespaceDefaults['notfound_controller'];
          $this->action = Config::rootNamespaceDefaults['notfound_action'];
          $this->controller = new $error_controller_name($this->action);
        }

    }

    public function dispatch()
    {
      $this->controller->before();

      call_user_func_array(
        array($this->controller, $this->action),
        $this->parameters
      );

      $this->controller->after();
    }

    private function splitUrl($url)
    {

      $namespace = Config::rootNamespace;
      $controller = Config::rootNamespaceDefaults['controller'];
      $action = Config::rootNamespaceDefaults['action'];
      $potencialNamespace = "";

      $url = trim($url, '/');
      $url = filter_var($url, FILTER_SANITIZE_URL);

      $urlElements = array_filter(explode('/', $url));
      empty($urlElements)?: $potencialNamespace = ucfirst($urlElements[0]) . '\\';

      if (isset(Config::additionalNamespaces[$potencialNamespace])) {
        $namespace .= $potencialNamespace;
        $controller = Config::additionalNamespaces[$potencialNamespace]['controller'];
        $action = Config::additionalNamespaces[$potencialNamespace]['action'];

        array_shift($urlElements);
      }

      empty($urlElements)?: $controller = array_shift($urlElements);
      empty($urlElements)?: $action = array_shift($urlElements);

      return [$namespace, ucfirst($controller), $action, $urlElements];

    }
}
