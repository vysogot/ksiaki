<?php

namespace App\Controllers\Admin;

use \Core\Redirect;

use \App\Models\Contest as Model;

class Contest extends Front
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
      $contests = Model::all();
      $this->View->render('admin/contest/index', array('contests' => $contests));
    }

    public function show($contest_id)
    {
      $contest = Model::find($contest_id);
      $this->View->render('admin/contest/show', array('contest' => $contest));
    }

    public function prepare()
    {
      $contest = new Model;
      $this->View->render('admin/contest/prepare', array('contest' => $contest));
    }

    public function create()
    {
      $contest = Model::create($_POST);

      if ($contest) {
        Redirect::to('admin/contest/show/' . $contest->id);
      } else {
        $this->View->render('admin/contest/prepare',
          array('contest' => $contest, 'error' => $contest->errors));
      }
    }

    public function edit($contest_id)
    {
      $contest = Model::find($contest_id);

      if ($contest) {
        $this->View->render('admin/contest/edit', array('contest' => $contest));
      } else {
        Redirect::to('admin/contest/index/');
      }
    }

    public function update($contest_id)
    {
      $contest = Model::update($_POST);

      if ($contest) {
        Redirect::to('admin/contest/show/' . $contest->id);
      } else {
        $this->View->render('admin/contest/edit',
          array('contest' => $contest, 'error' => $contest->errors));
      }
    }

    public function destroy($contest_id)
    {
      Model::destroy($contest_id);
      Redirect::to('admin/contest/index');
    }
}
