$(document).ready(function(){
    var levelStartTimestamp = 0;
    var token = 0;

    var oMain = new CMain({
            card_per_level :   [4,      //NUM CARD IN LEVEL 1
                                8,      //NUM CARD IN LEVEL 2
                                16,     //NUM CARD IN LEVEL 3
                                32      //NUM CARD IN LEVEL 4
                                ],

            time_level:[30,  //NUM SECONDS PER LEVEL 1
                        60,  //NUM SECONDS PER LEVEL 2
                        120, //NUM SECONDS PER LEVEL 3
                        240  //NUM SECONDS PER LEVEL 4
                        ],

            score_match_card: 10,     //SCORE ASSIGNED WHEN USER MATCH TWO CARDS
            score_time_left_mult: 2,  //MULTIPLIER ASSIGNED TO REMAINING LEVEL TIME
            time_match_mult: 3000,     //TIME AVAILABLE BETWEEN DISCOVERED MATCHING TO GET SCORE MULTIPLIER
            show_cards: 0,             //IF YOU WANT TO SHOW CARDS FOR SOME SECONDS WHEN LEVEL START, SET THIS VALUE > 0 (NUM OF SECONDS)
            fullscreen:true, //SET THIS TO FALSE IF YOU DON'T WANT TO SHOW FULLSCREEN BUTTON
            check_orientation:true     //SET TO FALSE IF YOU DON'T WANT TO SHOW ORIENTATION ALERT ON MOBILE DEVICES
    });

        $(oMain).on("start_session", function(evt) {});

        $(oMain).on("end_session", function(evt) {});

        $(oMain).on("start_level", function(evt, iLevel) { 

            $.ajax({
                dataType: "json",
                url: "/timestamp.php",
            }).always(function(data) {
                levelStartTimestamp = data['timestamp'];
                token = data['token'];
            });

        });

        $(oMain).on("end_level", function(evt, iLevel, iScoreLevel, iScoreTotal, sMainBallColor, sTickTime) {

              $.post("/score.php", {
                  token: token,
                  contest_id: window.parent.contestId,
                  level: iLevel,
                  begins_at: levelStartTimestamp,
                  points: iScoreLevel,
                  points_total: iScoreTotal,
                  main_ball_color: sMainBallColor,
                  win: 1,
                  tick_time: sTickTime
              });

        });

        $(oMain).on("save_score", function(evt, iLevel, iScoreLevel, iScoreTotal, sMainBallColor, sTickTime) {

              $.post("/score.php", {
                  token: token,
                  contest_id: window.parent.contestId,
                  level: iLevel,
                  begins_at: levelStartTimestamp,
                  points: iScoreLevel,
                  points_total: iScoreTotal,
                  main_ball_color: sMainBallColor,
                  win: 0,
                  tick_time: sTickTime
              });

        });

        $(oMain).on("show_interlevel_ad", function(evt) {});

        $(oMain).on("share_event", function(evt, iScore) {});

        if(isIOS()){
            setTimeout(function(){sizeHandler();},200);
        }else{
            sizeHandler();
        }
});
