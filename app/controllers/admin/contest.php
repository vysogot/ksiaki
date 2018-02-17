<?php

namespace App\Controllers\Admin;

use \Core\Redirect;

use \App\Models\Contest as Model;

class Contest extends Front
{
    public function __construct($action)
    {
      parent::__construct(self::class, $action);
    }

    public function index()
    {
      $contests = Model::all(array('offset' => 0, 'limit' => 50));
      $this->view->render('admin/contest/index', array('contests' => $contests));
    }

    public function show($contest_id)
    {
      $contest = Model::find($contest_id);
      $this->view->render('admin/contest/show', array('contest' => $contest));
    }

    public function prepare()
    {
      $contest = new Model;
      $this->view->render('admin/contest/prepare', array('contest' => $contest));
    }

    public function create()
    {
      $contest = Model::create($_POST);

      if ($contest) {
        $this->redirectTo('admin/contest/show/' . $contest->id);
      } else {
        $this->view->render('admin/contest/prepare',
          array('contest' => $contest, 'error' => $contest->errors));
      }
    }

    public function edit($contest_id)
    {
      $contest = Model::find($contest_id);

      if ($contest) {
        $this->view->render('admin/contest/edit', array('contest' => $contest));
      } else {
        $this->redirectTo('admin/contest/index/');
      }
    }

    public function update($contest_id)
    {
      $contest = Model::update($_POST);

      if ($contest) {
        $this->redirectTo('admin/contest/show/' . $contest->id);
      } else {
        $this->view->render('admin/contest/edit',
          array('contest' => $contest, 'error' => $contest->errors));
      }
    }

    public function destroy($contest_id)
    {
      Model::destroy($contest_id);
      $this->redirectTo('admin/contest/index');
    }
}
