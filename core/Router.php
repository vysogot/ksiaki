<?php

namespace Core;

class Router
{

    public function __construct($url)
    {

        list($namespace, $controller, $action, $parameters) = $this->splitUrl($url);

        $controller = "App\\Controller\\$namespace" . $controller;
        $controller = new $controller;

        if (method_exists($controller, $action)) {
          call_user_func_array(array($controller, $action), $parameters);
        } else {
          $controller = new ErrorController;
          $controller->error404();
        }

    }

    private function splitUrl($url)
    {
        if ($url) {

            $namespace = $controller = $action = "";

            $url = trim($url, '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = array_filter(explode('/', $url));

            // check for known namespaces
            if (!empty($url) && ($url[0] == 'admin')) {
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
}
