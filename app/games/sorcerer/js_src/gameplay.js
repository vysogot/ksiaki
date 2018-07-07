$(document).ready(function() {
    var levelStartTimestamp = 0;
    var token = 0;

    var oMain = new CMain({
        fullscreen: true, //SET THIS TO FALSE IF YOU DON'T WANT TO SHOW FULLSCREEN BUTTON
        check_orientation: true, //SET TO FALSE IF YOU DON'T WANT TO SHOW ORIENTATION ALERT ON MOBILE DEVICES
        combo_value: 50, //amount added to the score for each ball exploded in a combo
        extra_score: 100, //amount added to the score when level is completely cleared
    });

    $(oMain).on("start_session", function(evt) {});
    $(oMain).on("end_session", function(evt) {});
    $(oMain).on("save_score", function(evt, iScore, iLevel, sMainBallColor, bWin, sTickTime) {

        // Don't save when game finished because it fires "end_level" anyway
        if (!bWin) {

            iWin = bWin ? 1 : 0;

            $.post("/score.php", {
                token: token,
                contest_id: window.parent.contestId,
                level: iLevel,
                begins_at: levelStartTimestamp,
                points: iScore - this.getScoreTillLevel(iLevel),
                points_total: iScore,
                main_ball_color: sMainBallColor,
                win: iWin,
                tick_time: sTickTime
            });
        }
    });

    $(oMain).on("start_level", function(evt, iLevel) {
        $.ajax({
            dataType: "json",
            url: "/timestamp.php",
        }).always(function(data) {
            levelStartTimestamp = data['timestamp'];
            token = data['token'];
        });
    });

    $(oMain).on("end_level", function(evt, iLevel, iLevelScore, iTotalScore, sMainBallColor, sTickTime) {
        $.post("/score.php", {
            token: token,
            contest_id: window.parent.contestId,
            level: iLevel,
            begins_at: levelStartTimestamp,
            points: iLevelScore,
            points_total: iTotalScore,
            main_ball_color: sMainBallColor,
            win: 1,
            tick_time: sTickTime
        });
    });

    $(oMain).on("show_interlevel_ad", function(evt) {});

    $(oMain).on("share_event", function(evt, iScore) {});

    if (isIOS()) {
        setTimeout(function() {
            sizeHandler();
        }, 200);
    } else {
        sizeHandler();
    }
});
