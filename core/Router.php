<?php

namespace Core;

class Router
{

    const rootNamespace = "App\\Controllers\\";
    const rootNamespaceDefaults = [
      'controller' => 'home',
      'action' => 'index',
      'notfound_controller' => 'Error',
      'notfound_action' => 'error404'
    ];

    const additionalNamespaces = [
      'Admin\\' => [
        'controller' => 'home',
        'action' => 'index'
      ]
    ];

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
          $error_controller_name = self::rootNamespace . self::rootNamespaceDefaults['notfound_controller'];
          $this->action = self::rootNamespaceDefaults['notfound_action'];
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

      $namespace = self::rootNamespace;
      $controller = $action = '';

      $url = trim($url, '/');
      $url = filter_var($url, FILTER_SANITIZE_URL);

      $urlElements = explode('/', $url);
      $potencialNamespace = ucfirst($urlElements[0]) . '\\';

      if (isset(self::additionalNamespaces[$potencialNamespace])) {
        $namespace .= $potencialNamespace;
        $controller = self::additionalNamespaces[$potencialNamespace]['controller'];
        $action = self::additionalNamespaces[$potencialNamespace]['action'];

        array_shift($urlElements);
      }

      switch (count($urlElements)) {
        case 0:
          !empty($controller)?: $controller = self::rootNamespace['controller'];
          !empty($action)?: $action = self::rootNamespace['action'];
          break;
        case 1:
          $controller = array_shift($urlElements);
          !empty($action)?: $action = self::rootNamespace['action'];
          break;
        default:
          $controller = array_shift($urlElements);
          $action = array_shift($urlElements);
          break;
      }

      return [$namespace, ucfirst($controller), $action, $urlElements];

    }
}
