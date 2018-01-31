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

    /**
     * Handles what happens when user moves to URL/contest/index - or - as this is the default controller, also
     * when user moves to /index or enter your application at base level
     */
    public function index()
    {
        $this->View->render('admin/contest/index');
    }

    public function prepare()
    {
        $this->View->render('admin/contest/prepare', array(
            'contest' => ContestModel::getContest(0)));
    }

    public function create()
    {
        $this->View->render('admin/contest/show');
    }

    public function edit()
    {
        $this->View->render('admin/contest/edit');
    }

    public function update()
    {
        ContestModel::updateContest(Request::post('contest_id')
        , Request::post('contest_game_id')
        , Request::post('contest_contest_type_id')
        , Request::post('contest_name')
        , Request::post('contest_description')
        , Request::post('contest_banner_url')
        , Request::post('contest_begins_at')
        , Request::post('contest_ends_at')
        );
        Redirect::to('adminContest');
        
        //$this->View->render('admin/contest/show');
        
    }

    public function destroy()
    {
        $this->View->render('admin/contest/index');
    }
}
