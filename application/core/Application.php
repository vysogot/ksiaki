<?php

class Application
{

    public function __construct($url)
    {

        list($namespace, $controller, $action, $parameters) = $this->splitUrl($url);
        $controller = ucfirst($controller) . "Controller";
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

            switch (count($url)) {
              case 0:
                $controller = Config::get('DEFAULT_CONTROLLER');
                $action = Config::get('DEFAULT_ACTION');
                break;
              case 1:
                $controller = array_shift($url);
                $action = Config::get('DEFAULT_ACTION');
                break;
              case 2:
              case 3:
                $controller = array_shift($url);
                $action = array_shift($url);
                break;
              default:
                $namespace = array_shift($url);
                $controller = array_shift($url);
                $action = array_shift($url);
                break;
            }

            $parameters = array_values($url);
            return [$namespace, $controller, $action, $parameters];
        }
    }
}
