<?php

namespace App\Controllers\Admin;

use \App\Models\Contest as Model;

class Contest extends Front
{
    public function __construct($action)
    {
      parent::__construct(self::class, $action);
    }

    public function index()
    {
      $contests = Model::all(['offset' => 0, 'limit' => 50]);
      $this->render('admin/contest/index', ['contests' => $contests]);
    }

    public function show($contest_id)
    {
      $contest = Model::find($contest_id);
      $this->render('admin/contest/show', ['contest' => $contest]);
    }

    public function prepare()
    {
      $contest = new Model;
      $this->render('admin/contest/prepare', ['contest' => $contest]);
    }

    public function create()
    {
      $contest = new Model($_POST);

      if ($contest->save()) {
        $this->redirect('admin/contest/show/' . $contest->id);
      } else {
        $this->render('admin/contest/prepare', ['contest' => $contest]);
      }
    }

    public function edit($contest_id)
    {
      $contest = Model::find($contest_id);

      if ($contest) {
        $this->render('admin/contest/edit', ['contest' => $contest]);
      } else {
        $this->redirect('admin/contest/index/');
      }
    }

    public function update()
    {
      $contest = Model::find($_POST['id']);

      if ($contest && $contest->update($_POST)) {
        $this->redirect('admin/contest/show/' . $contest->id);
      } else {
        $this->render('admin/contest/edit', ['contest' => $contest]);
      }
    }

    public function destroy()
    {
      Model::destroy($_POST['id']);
      $this->redirect('admin/contest/index');
    }
}
