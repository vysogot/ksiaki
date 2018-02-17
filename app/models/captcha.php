<?php

namespace App\Models;

class Captcha
{

  public function __construct()
  {
    $this->width = Config::get('CAPTCHA_WIDTH');
    $this->height = Config::get('CAPTCHA_HEIGHT');
  }

  public function create()
  {
    $captcha = new Gregwar\Captcha\CaptchaBuilder;
    $captcha->build($this->width, $this->height);

    $this->session->set('captcha', $captcha->getPhrase());
    header('Content-type: image/jpeg');
    $captcha->output();
  }

  public function check($captcha)
  {
    if ($this->session->get('captcha') && ($captcha == $this->session->get('captcha'))) {
        return true;
    }

    return false;
  }
}
