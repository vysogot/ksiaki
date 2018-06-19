<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/main.css" type="text/css">
		<link rel="stylesheet" href="css/orientation_utils.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui" />
	<meta name="msapplication-tap-highlight" content="no"/>

        <script type="text/javascript" src="/games/memory/js/memory.min.js?v=<?php echo filemtime("js/memory.min.js")?>"></script>

    </head>
    <body ondragstart="return false;" ondrop="return false;" >
	<div style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%"></div>
          <script>
            $(document).ready(function(){
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

                    $(oMain).on("start_session", function(evt) {
                        if(getParamValue('ctl-arcade') === "true"){
                            parent.__ctlArcadeStartSession();
                        }
                        //...ADD YOUR CODE HERE EVENTUALLY
                    });

                    $(oMain).on("end_session", function(evt) {
                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeEndSession();
                           }
                           //...ADD YOUR CODE HERE EVENTUALLY
                    });

                    $(oMain).on("start_level", function(evt, iLevel) {
                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeStartLevel({level:iLevel});
                           }
                    });

                    $(oMain).on("end_level", function(evt,iLevel) {
                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeEndLevel({level:iLevel});
                           }
                    });

                    $(oMain).on("save_score", function(evt,iScore) {
                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeSaveScore({score:iScore});
                           }
                           //...ADD YOUR CODE HERE EVENTUALLY
                    });

                    $(oMain).on("show_interlevel_ad", function(evt) {
                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeShowInterlevelAD();
                           }
                           //...ADD YOUR CODE HERE EVENTUALLY
                    });

                    $(oMain).on("share_event", function(evt, iScore) {

                           if(getParamValue('ctl-arcade') === "true"){
                               parent.__ctlArcadeShareEvent({   img: TEXT_SHARE_IMAGE,
                                                                title: TEXT_SHARE_TITLE,
                                                                msg: TEXT_SHARE_MSG1 + iScore + TEXT_SHARE_MSG2,
                                                                msg_share: TEXT_SHARE_SHARE1 + iScore + TEXT_SHARE_SHARE1});
                           }
                    });

                    if(isIOS()){
                        setTimeout(function(){sizeHandler();},200);
                    }else{
                        sizeHandler();
                    }
           });

        </script>
        <canvas id="canvas" class='ani_hack' width="1920" height="1080"> </canvas>
		<div data-orientation="landscape" class="orientation-msg-container"><p class="orientation-msg-text">Please rotate your device</p></div>
        <div id="block_game" style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%; display:none"></div>
    </body>
</html>
