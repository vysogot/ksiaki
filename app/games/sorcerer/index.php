<!DOCTYPE html>
<html>

<head>
    <title></title>
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="/games/sorcerer/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/games/sorcerer/css/main.css" type="text/css">
    <link rel="stylesheet" href="/games/sorcerer/css/orientation_utils.css" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui" />
    <meta name="msapplication-tap-highlight" content="no" />

    <script type="text/javascript" src="/games/sorcerer/js/sorcerer.min.js?v=<?php echo filemtime("js/sorcerer.min.js")?>"></script>

</head>

<body ondragstart="return false;" ondrop="return false;">
    <div style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%"></div>
    <script>
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
            $(oMain).on("save_score", function(evt, iScore, iLevel, sMainBallColor) {

                $.post("/score.php", {
                    token: token,
                    contest_id: window.parent.contestId,
                    level: iLevel,
                    begins_at: levelStartTimestamp,
                    points: iScore - this.getScoreTillLevel(iLevel),
                    points_total: iScore,
                    main_ball_color: sMainBallColor,
                    win: 0
                });
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

            $(oMain).on("end_level", function(evt, iLevel, iLevelScore, iTotalScore, sMainBallColor) {
                $.post("/score.php", {
                    token: token,
                    contest_id: window.parent.contestId,
                    level: iLevel,
                    begins_at: levelStartTimestamp,
                    points: iLevelScore,
                    points_total: iTotalScore,
                    main_ball_color: sMainBallColor,
                    win: 1
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

    </script>
    <canvas id="canvas" class='ani_hack' width="960" height="540"> </canvas>
    <div data-orientation="landscape" class="orientation-msg-container">
        <p class="orientation-msg-text">Please rotate your device</p>
    </div>
    <div id="block_game" style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%; display:none"></div>
</body>

</html>
