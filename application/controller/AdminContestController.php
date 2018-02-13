<?php

class AdminContestController extends Controller
{
    /**
     * Construct this object by extending the basic Controller class
     */
    public function __construct()
    {
        parent::__construct();
        Auth::checkAuthentication();
    }

    public function index()
    {
      $contests = ContestModel::all();
      $this->View->render('admin/contest/index', array('contests' => $contests));
    }

    public function show($contest_id)
    {
      $contest = ContestModel::find($contest_id);
      $this->View->render('admin/contest/show', array('contest' => $contest));
    }

    public function prepare()
    {
      $contest = new ContestModel;
      $this->View->render('admin/contest/prepare', array('contest' => $contest));
    }

    public function create()
    {
      $contest = ContestModel::create($_POST);

      if ($contest) {
        Redirect::to('adminContest/show/' . $contest->id);
      } else {
        echo 'nie udało się utworzyć';
      }
    }

    public function edit($contest_id)
    {
      $contest = ContestModel::find($contest_id);

      if ($contest) {
        $this->View->render('admin/contest/edit', array('contest' => $contest));
      } else {
        echo 'nie znaleziono';
      }
    }

    public function update($contest_id)
    {
      $contest = ContestModel::update($_POST);

      if ($contest) {
        Redirect::to('adminContest/show/' . $contest->id);
      } else {
        echo 'nie zaktualizowano';
      }
    }

    public function destroy($contest_id)
    {
      ContestModel::destroy($contest_id);
      Redirect::to('adminContest/index');
    }

}
