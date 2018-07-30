var ASSETS_PATH = window.parent.assetsUrl;
var CREDITS_LINK = window.parent.sponsorUrl;

/* replace line inside sprite_lib.js */

// _oLibSprites[szKey] = { szPath: ASSETS_PATH + szPath, oSprite: new Image() };

function ServerScore(sGameSettings){

    var _sBlackColor = "000000";
    var _sMainBallColor;
    var _sGameSettings;
    var _sToken;
    var _iContestId;
    var _iBeginsAt;

    this._init = function(sGameSettings) {

        _sGameSettings = sGameSettings;
        _iContestId = window.parent.contestId;

        $.ajax({
            dataType: "json",
            url: "/timestamp.php",
        }).always(function(data) {
            _iBeginsAt = data['timestamp'];
            _sToken = data['token'];
        });

    }

    this.send = function(iCurLevel, iCurLevelScore, iTotalScore, iWin) {

        console.log(iTotalScore);
        _sMainBallColor = (_sBlackColor + iTotalScore.toString(16)).substr(-6,6);

        $.post("/score.php", {
            token: _sToken,
            contest_id: _iContestId,
            level: iCurLevel,
            begins_at: _iBeginsAt,
            points: iCurLevelScore,
            points_total: iTotalScore,
            main_ball_color: _sMainBallColor,
            win: iWin,
            tick_time: _sGameSettings
        });
    }

    this._init(sGameSettings);

}