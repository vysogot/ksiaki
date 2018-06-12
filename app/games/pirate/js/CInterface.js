function CInterface() {
    var _oAudioToggle;
    var _pStartPosPause;
    var _pStartPosAudio;
    var _pStartPosExit;
    var _pStartPosFullscreen;
    
    var _oButFullscreen;
    var _fRequestFullScreen = null;
    var _fCancelFullScreen = null;
    var _oButPause;
    var _oPauseTextContainer;
    var _oButExit;
    var _oButContinue;
    var _oButPrev;
    var _oScoreText;
    var _oScoreTextStruct;
    var _oFade;
    var _oButReturnToMenu;
    var _oTransBg;
    var _oButNextLevel;
    var _oLevelCompleteContainer;
    var _oFinishGameContainer;
    var _oHelpPanel;
    var _oLevelText;
    var _oLife;
    var _oLifeText;
    var _oLifeTextStruct;
    var _oGameOver;
    var _oTextGameOver;
    var _oGameOverContainer;
    var _oButRestart;
    var _oLifeTextContainer;
    var _pStartPosLifeText;
    var _oScoreTextContainer;
    var _oFpsText;
    var _oFpsTextStruct;
    var _oHelpContainer;
    var _oHelpTitleContainer;
    var _oTextMoneyTot;
    var _oTextMoneyTotStruct;
    var _oTextMoneyContainer;
    var _pStartPosTextMoney;
    var _oMoneySprite;
    var _iTotCoin;
    var _iPosHandX;
    var _oPauseBg;
    var _oGameOverPanel;

    this._init = function () {
        var oButtonX;
        
        var oSpritePause = s_oSpriteLibrary.getSprite('but_pause');
        oButtonX = CANVAS_WIDTH - (oSpritePause.width / 2) - 110;
        _pStartPosPause = {x: oButtonX, y: (oSpritePause.height / 2) + 20};
        _oButPause = new CGfxButton(_pStartPosPause.x, _pStartPosPause.y, oSpritePause);
        _oButPause.addEventListener(ON_MOUSE_UP, this.onButPauseRelease, this);
        
        if (DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            var oSprite = s_oSpriteLibrary.getSprite('icon_audio');
            oButtonX = CANVAS_WIDTH - (oSprite.width / 2) - 170;
            _pStartPosAudio = {x: oButtonX, y: (oSprite.height / 2) + 20};
            _oAudioToggle = new CToggle(_pStartPosAudio.x, _pStartPosAudio.y, oSprite, s_bAudioActive);
            _oAudioToggle.addEventListener(ON_MOUSE_UP, this._onAudioToggle, this);
             _pStartPosFullscreen = {x: _pStartPosAudio.x - oSprite.width/2  - 10,y:_pStartPosAudio.y};
        }else{
            _pStartPosFullscreen = {x: _pStartPosPause.x - (oSpritePause.width) -10,y: _pStartPosPause.y};
        }

        var oSpriteExit = s_oSpriteLibrary.getSprite('but_exit');
        oButtonX = CANVAS_WIDTH - (oSpriteExit.width / 2) - 10;
        _pStartPosExit = {x: oButtonX, y: (oSpriteExit.height / 2) + 20};
        _oButExit = new CGfxButton(_pStartPosExit.x, _pStartPosExit.y, oSpriteExit);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);

        
        
        var doc = window.document;
        var docEl = doc.documentElement;
        _fRequestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;
        _fCancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;
        
        if(ENABLE_FULLSCREEN === false){
            _fRequestFullScreen = false;
        }
        
        if (_fRequestFullScreen && screenfull.enabled){
            oSprite = s_oSpriteLibrary.getSprite('but_fullscreen');
            

            _oButFullscreen = new CToggle(_pStartPosFullscreen.x,_pStartPosFullscreen.y,oSprite,s_bFullscreen,true);
            _oButFullscreen.addEventListener(ON_MOUSE_UP, this._onFullscreenRelease, this);
        }
        
        _oScoreTextContainer = new createjs.Container();
        _oScoreTextContainer.x = CANVAS_WIDTH / 2 - 100;
        _oScoreTextContainer.y = CANVAS_HEIGHT / 2 + 550;

        _oScoreText = new createjs.Text(TEXT_SCORE + " 0", "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        _oScoreText.textAlign = "left";
        _oScoreText.textBaseline = "alphabetic";
        _oScoreText.x = 0;
        _oScoreText.y = 0;

        _oScoreTextStruct = new createjs.Text(TEXT_SCORE + " 0", "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        _oScoreTextStruct.textAlign = "left";
        _oScoreTextStruct.textBaseline = "alphabetic";
        _oScoreTextStruct.x = 2;
        _oScoreTextStruct.y = 2;

        _oScoreTextContainer.addChild(_oScoreTextStruct, _oScoreText);

        s_oStage.addChild(_oScoreTextContainer);

        _pStartPosLifeText = {x: CANVAS_WIDTH / 2, y: CANVAS_HEIGHT / 2 - 630};

        _oLifeTextContainer = new createjs.Container();
        _oLifeTextContainer.x = _pStartPosLifeText.x;
        _oLifeTextContainer.y = _pStartPosLifeText.y;

        var oSpriteLife = s_oSpriteLibrary.getSprite("life");
        _oLife = createBitmap(oSpriteLife);
        _oLife.x =  - 340;
        _oLife.y = CANVAS_HEIGHT * 0.5 - 600;
        _oLife.regX = oSpriteLife.width;
        _oLife.regY = oSpriteLife.height;

        _oLifeText = new createjs.Text("x" + LIVES, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        _oLifeText.textAlign = "center";
        _oLifeText.textBaseline = "alphabetic";
        _oLifeText.x = _oLife.x + 30;
        _oLifeText.y = _oLife.y - 10;

        _oLifeTextStruct = new createjs.Text("x" + LIVES, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        _oLifeTextStruct.textAlign = "center";
        _oLifeTextStruct.textBaseline = "alphabetic";
        _oLifeTextStruct.x = _oLifeText.x + 2;
        _oLifeTextStruct.y = _oLifeText.y + 2;

        if (SHOW_FPS === true) {
            var iX = -330;
            var iY = 550;
            _oFpsText = new createjs.Text("", "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
            _oFpsText.textAlign = "center";
            _oFpsText.textBaseline = "alphabetic";
            _oFpsText.x = CANVAS_WIDTH * 0.5 + iX;
            _oFpsText.y = CANVAS_HEIGHT * 0.5 + iY;

            _oFpsTextStruct = new createjs.Text("", "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
            _oFpsTextStruct.textAlign = "center";
            _oFpsTextStruct.textBaseline = "alphabetic";
            _oFpsTextStruct.x = CANVAS_WIDTH * 0.5 + iX + 2;
            _oFpsTextStruct.y = CANVAS_HEIGHT * 0.5 + iY + 2;

            s_oStage.addChild(_oFpsTextStruct, _oFpsText);
        }

        _oLifeTextContainer.addChild(_oLifeTextStruct, _oLife, _oLifeText);

        s_oStage.addChild(_oLifeTextContainer);

        this.moneyCount();

        this.refreshButtonPos(s_iOffsetX, s_iOffsetY);
    };

    this.refreshButtonPos = function (iNewX, iNewY) {
        if (DISABLE_SOUND_MOBILE === false || s_bMobile === false) {
            _oAudioToggle.setPosition(_pStartPosAudio.x - iNewX, _pStartPosAudio.y + iNewY);
        }
        if (_fRequestFullScreen && screenfull.enabled){
            _oButFullscreen.setPosition(_pStartPosFullscreen.x - iNewX,_pStartPosFullscreen.y + iNewY);
        }
        _oButPause.setPosition(_pStartPosPause.x - iNewX, _pStartPosPause.y + iNewY);
        _oButExit.setPosition(_pStartPosExit.x - iNewX, _pStartPosExit.y + iNewY);

        _oLifeTextContainer.y = _pStartPosLifeText.y + iNewY;

        _oTextMoneyContainer.y = _pStartPosTextMoney.y + iNewY;
    };


    this.levelComplete = function (iLevel, iScore, iEnemyKilled, iLevelScore) {
        var iLv = iLevel + 1;
        setVolume("soundtrack", 0.1);
        if (iLv < OBJECTS_LEVEL_POSITION.length) {
            

            _oButPause.block(true);

            _oLevelCompleteContainer = new createjs.Container();
            
            var oMsgBox = createBitmap(s_oSpriteLibrary.getSprite("msg_box"));
            
            var oTextTitle;

            oTextTitle = new createjs.Text(TEXT_TITLE,  "100px " + PRIMARY_FONT, "#ffb400");
            oTextTitle.textAlign = "center";
            oTextTitle.textBaseline = "alphabetic";
            oTextTitle.lineWidth = 500;
            oTextTitle.lineHeight = 60;
            oTextTitle.x = CANVAS_WIDTH/2;
            oTextTitle.y = 520;

            var oTextTitleStruct;

            oTextTitleStruct = new createjs.Text(TEXT_TITLE, "100px " + PRIMARY_FONT, "#000000");
            oTextTitleStruct.textAlign = "center";
            oTextTitleStruct.textBaseline = "alphabetic";
            oTextTitleStruct.lineWidth = 500;
            oTextTitleStruct.lineHeight = 60;
            oTextTitleStruct.x = CANVAS_WIDTH/2;
            oTextTitleStruct.y = 520;
            oTextTitleStruct.outline = OUTLINE_TEXT;

            var oTextLevelComplete;

            oTextLevelComplete = new createjs.Text(TEXT_LEVEL + " " + iLv + " " + TEXT_COMPLETE, "normal " + 70 + "px " + PRIMARY_FONT, "#ffb400");
            oTextLevelComplete.textAlign = "center";
            oTextLevelComplete.textBaseline = "alphabetic";
            oTextLevelComplete.lineWidth = 700;
            oTextLevelComplete.lineHeight = 60;
            oTextLevelComplete.x = CANVAS_WIDTH/2;
            oTextLevelComplete.y = 630;

            var oTextLevelCompleteStruct;

            oTextLevelCompleteStruct = new createjs.Text(TEXT_LEVEL + " " + iLv + " " + TEXT_COMPLETE, "normal " + 70 + "px " + PRIMARY_FONT, "#000000");
            oTextLevelCompleteStruct.textAlign = "center";
            oTextLevelCompleteStruct.textBaseline = "alphabetic";
            oTextLevelCompleteStruct.lineWidth = 700;
            oTextLevelCompleteStruct.lineHeight = 60;
            oTextLevelCompleteStruct.x = CANVAS_WIDTH/2;
            oTextLevelCompleteStruct.y = 630;
            oTextLevelCompleteStruct.outline = OUTLINE_TEXT;

            var oEnemyDied;
            var oSpriteEnemyLeftRight = s_oSpriteLibrary.getSprite("enemy_left_right_0");
            var oData = {
                images: [oSpriteEnemyLeftRight],
                // width, height & registration point of each sprite
                frames: {width: oSpriteEnemyLeftRight.width / 9, height: oSpriteEnemyLeftRight.height / 6, regX: (oSpriteEnemyLeftRight.width / 2) / 9 + ENEMY_OFFSET_REG[0].x, regY: (oSpriteEnemyLeftRight.height / 2) / 6 + ENEMY_OFFSET_REG[0].y},
                animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
            };
            var oSpriteSheetHeroLeftRight = new createjs.SpriteSheet(oData);

            oEnemyDied = createSprite(oSpriteSheetHeroLeftRight, 53, ((oSpriteEnemyLeftRight.width / 2) / 9) + ENEMY_OFFSET_REG[0].x, 
                                                        ((oSpriteEnemyLeftRight.height / 2) / 6) + ENEMY_OFFSET_REG[0].y, oSpriteEnemyLeftRight.width / 9, 
                                                          oSpriteEnemyLeftRight.height / 6);
            oEnemyDied.gotoAndStop(53);

            oEnemyDied.x = CANVAS_WIDTH/2 - 50;
            oEnemyDied.y = 750;

            var oTextEnemyKilled;

            oTextEnemyKilled = new createjs.Text("x" + iEnemyKilled, "normal " + 80 + "px " + PRIMARY_FONT, "#ffb400");
            oTextEnemyKilled.textAlign = "center";
            oTextEnemyKilled.textBaseline = "alphabetic";
            oTextEnemyKilled.x = CANVAS_WIDTH/2 + 50;
            oTextEnemyKilled.y = 760;

            var oTextEnemyKilledStruct;

            oTextEnemyKilledStruct = new createjs.Text("x" + iEnemyKilled, "normal " + 80 + "px " + PRIMARY_FONT, "#000000");
            oTextEnemyKilledStruct.textAlign = "center";
            oTextEnemyKilledStruct.textBaseline = "alphabetic";
            oTextEnemyKilledStruct.x = CANVAS_WIDTH/2 + 50;
            oTextEnemyKilledStruct.y = 760;
            oTextEnemyKilledStruct.outline = OUTLINE_TEXT;

            var oTextLevelScore;

            oTextLevelScore = new createjs.Text(TEXT_LEVEL + " " + TEXT_SCORE_CASE + " " + iLevelScore, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
            oTextLevelScore.textAlign = "center";
            oTextLevelScore.textBaseline = "alphabetic";
            oTextLevelScore.x = CANVAS_WIDTH/2;
            oTextLevelScore.y = 920;

            var oTextLevelScoreStruct;

            oTextLevelScoreStruct = new createjs.Text(TEXT_LEVEL + " " + TEXT_SCORE_CASE + " " + iLevelScore, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
            oTextLevelScoreStruct.textAlign = "center";
            oTextLevelScoreStruct.textBaseline = "alphabetic";
            oTextLevelScoreStruct.x = CANVAS_WIDTH/2;
            oTextLevelScoreStruct.y = 920;
            oTextLevelScoreStruct.outline = OUTLINE_TEXT;

            var oTextScore;

            oTextScore = new createjs.Text(TEXT_SCORE_GAMEOVER + "  " + iScore, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
            oTextScore.textAlign = "center";
            oTextScore.textBaseline = "alphabetic";
            oTextScore.x = CANVAS_WIDTH/2;
            oTextScore.y = 1050;

            var oTextScoreStruct;

            oTextScoreStruct = new createjs.Text(TEXT_SCORE_GAMEOVER + "  " + iScore, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
            oTextScoreStruct.textAlign = "center";
            oTextScoreStruct.textBaseline = "alphabetic";
            oTextScoreStruct.x = CANVAS_WIDTH/2;
            oTextScoreStruct.y = 1050;
            oTextScoreStruct.outline = OUTLINE_TEXT;

            _oLevelCompleteContainer.alpha = 0;
            _oLevelCompleteContainer.addChild(oMsgBox, oTextEnemyKilledStruct, oTextEnemyKilled, oTextLevelCompleteStruct, oTextLevelComplete, oTextLevelScoreStruct, oTextLevelScore, oTextScoreStruct, oTextScore, oTextTitleStruct, oTextTitle, oEnemyDied);
            s_oStage.addChild(_oLevelCompleteContainer);

            createjs.Tween.get(_oLevelCompleteContainer).to({alpha: 1}, 1000, createjs.Ease.cubicOut).call(function () {
                var oSpriteButNext = s_oSpriteLibrary.getSprite("but_continue");
                _oButNextLevel = new CGfxButton((CANVAS_WIDTH / 2), CANVAS_HEIGHT / 2 + 450, oSpriteButNext);
                _oButNextLevel.addEventListener(ON_MOUSE_UP, s_oInterface._onButNextLevelRelease, this);
                s_oGame.nextLevelSpaceBar(true);
            });
            playSound("stage_clear", 1, false);
        }
        else{
            this.finishGame(iScore, iEnemyKilled);
        }
    };

    this.moneyCount = function () {
        var oPos = {x: -260, y: -630};

        _oTextMoneyTot = new createjs.Text(0 + "/" + 10, "normal " + 70 + "px " + PRIMARY_FONT, "#ffb400");
        _oTextMoneyTot.textAlign = "center";
        _oTextMoneyTot.textBaseline = "alphabetic";
        _oTextMoneyTot.x = CANVAS_WIDTH * 0.5 + oPos.x;
        _oTextMoneyTot.y = CANVAS_HEIGHT * 0.5 + oPos.y;

        _oTextMoneyTotStruct = new createjs.Text(0 + "/" + 10, "normal " + 70 + "px " + PRIMARY_FONT, "#000000");
        _oTextMoneyTotStruct.textAlign = "center";
        _oTextMoneyTotStruct.textBaseline = "alphabetic";
        _oTextMoneyTotStruct.x = CANVAS_WIDTH * 0.5 + oPos.x + 2;
        _oTextMoneyTotStruct.y = CANVAS_HEIGHT * 0.5 + oPos.y + 2;

        var iType = 2;

        var oSprite = s_oSpriteLibrary.getSprite("object_" + iType);

        var oData = {
            images: [oSprite],
            // width, height & registration point of each sprite
            frames: {width: (oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
            animations: OBJECT_SPRITESHEET_NUM[iType].animations
        };
        var oSpriteSheetHeroBottom = new createjs.SpriteSheet(oData);
        _oMoneySprite = createSprite(oSpriteSheetHeroBottom, "normal", ((oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width, oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height);
        _oMoneySprite.gotoAndStop(0);

        _oMoneySprite.x = CANVAS_WIDTH * 0.5 - 390;
        _oMoneySprite.y = CANVAS_HEIGHT * 0.5 - 657;

        _oTextMoneyContainer = new createjs.Container();
        _oTextMoneyContainer.x = 0;
        _oTextMoneyContainer.y = 0;

        _oTextMoneyContainer.addChild(_oTextMoneyTotStruct, _oTextMoneyTot, _oMoneySprite);

        _pStartPosTextMoney = {x: 0, y: 0};

        s_oStage.addChild(_oTextMoneyContainer);
    };

    this.getCoinSpriteCoordinate = function () {
        var oPos = {x: _oMoneySprite.x, y: _oMoneySprite.y + _oTextMoneyContainer.y};
        return oPos;
    };

    this.finishGame = function (iScore, iEnemyKilled) {
        s_oGame.setPause(true);

        _oButPause.block(true);

        var oMsgBox;

        oMsgBox = createBitmap(s_oSpriteLibrary.getSprite("bg_game_completed"));
        oMsgBox.x = -CANVAS_WIDTH * 0.5;
        oMsgBox.y = -CANVAS_HEIGHT * 0.5;

        var oTextTitle;

        oTextTitle = new createjs.Text(TEXT_TITLE, "normal " + 70 + "px " + PRIMARY_FONT, "#ffb400");
        oTextTitle.textAlign = "center";
        oTextTitle.textBaseline = "alphabetic";
        oTextTitle.lineWidth = 300;
        oTextTitle.lineHeight = 60;
        oTextTitle.x = 0;
        oTextTitle.y = -450;

        var oTextTitleStruct;

        oTextTitleStruct = new createjs.Text(TEXT_TITLE, "normal " + 70 + "px " + PRIMARY_FONT, "#000000");
        oTextTitleStruct.textAlign = "center";
        oTextTitleStruct.textBaseline = "alphabetic";
        oTextTitleStruct.lineWidth = 300;
        oTextTitleStruct.lineHeight = 60;
        oTextTitleStruct.x = 0;
        oTextTitleStruct.y = -450;
        oTextTitleStruct.outline = OUTLINE_TEXT;

        var oTextCongrat;

        oTextCongrat = new createjs.Text(TEXT_GAME_COMPLETED, "normal " + 70 + "px " + PRIMARY_FONT, "#ffb400");
        oTextCongrat.textAlign = "center";
        oTextCongrat.textBaseline = "alphabetic";
        oTextCongrat.lineWidth = 250;
        oTextCongrat.lineHeight = 60;
        oTextCongrat.x = 0;
        oTextCongrat.y = 0;

        var oTextCongratStruct;

        oTextCongratStruct = new createjs.Text(TEXT_GAME_COMPLETED, "normal " + 70 + "px " + PRIMARY_FONT, "#000000");
        oTextCongratStruct.textAlign = "center";
        oTextCongratStruct.textBaseline = "alphabetic";
        oTextCongratStruct.lineWidth = 250;
        oTextCongratStruct.lineHeight = 60;
        oTextCongratStruct.x = 0;
        oTextCongratStruct.y = 0;
        oTextCongratStruct.outline = OUTLINE_TEXT;

        var oEnemyDied;
        var oSpriteEnemyLeftRight = s_oSpriteLibrary.getSprite("enemy_left_right_0");
        var oData = {
            images: [oSpriteEnemyLeftRight],
            // width, height & registration point of each sprite
            frames: {width: oSpriteEnemyLeftRight.width / 9, height: oSpriteEnemyLeftRight.height / 6, regX: (oSpriteEnemyLeftRight.width / 2) / 9 + ENEMY_OFFSET_REG[0].x, regY: (oSpriteEnemyLeftRight.height / 2) / 6 + ENEMY_OFFSET_REG[0].y},
            animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
        };
        var oSpriteSheetHeroLeftRight = new createjs.SpriteSheet(oData);

        oEnemyDied = createSprite(oSpriteSheetHeroLeftRight, 53, ((oSpriteEnemyLeftRight.width / 2) / 9) + ENEMY_OFFSET_REG[0].x, ((oSpriteEnemyLeftRight.height / 2) / 6) + ENEMY_OFFSET_REG[0].y, oSpriteEnemyLeftRight.width / 9, oSpriteEnemyLeftRight.height / 6);

        oEnemyDied.gotoAndStop(53);

        oEnemyDied.x = -35;
        oEnemyDied.y = 160;

        var oTextEnemyKilled;

        oTextEnemyKilled = new createjs.Text("x" + iEnemyKilled, "normal " + 80 + "px " + PRIMARY_FONT, "#ffb400");
        oTextEnemyKilled.textAlign = "center";
        oTextEnemyKilled.textBaseline = "alphabetic";
        oTextEnemyKilled.x = 35;
        oTextEnemyKilled.y = 180;

        var oTextEnemyKilledStruct;

        oTextEnemyKilledStruct = new createjs.Text("x" + iEnemyKilled, "normal " + 80 + "px " + PRIMARY_FONT, "#000000");
        oTextEnemyKilledStruct.textAlign = "center";
        oTextEnemyKilledStruct.textBaseline = "alphabetic";
        oTextEnemyKilledStruct.x = 35;
        oTextEnemyKilledStruct.y = 180;
        oTextEnemyKilledStruct.outline = OUTLINE_TEXT;

        var oTextFinalScore;

        oTextFinalScore = new createjs.Text(TEXT_FINAL_SCORE + "\n" + iScore, "normal " + 80 + "px " + PRIMARY_FONT, "#ffb400");
        oTextFinalScore.textAlign = "center";
        oTextFinalScore.textBaseline = "alphabetic";
        oTextFinalScore.x = 0;
        oTextFinalScore.y = 300;

        var oTextFinalScoreStruct;

        oTextFinalScoreStruct = new createjs.Text(TEXT_FINAL_SCORE + "\n" + iScore, "normal " + 80 + "px " + PRIMARY_FONT, "#000000");
        oTextFinalScoreStruct.textAlign = "center";
        oTextFinalScoreStruct.textBaseline = "alphabetic";
        oTextFinalScoreStruct.x = 0;
        oTextFinalScoreStruct.y = 300;
        oTextFinalScoreStruct.outline = OUTLINE_TEXT;

        _oFinishGameContainer = new createjs.Container();
        _oFinishGameContainer.x = CANVAS_WIDTH * 0.5;
        _oFinishGameContainer.y = -100;

        _oFinishGameContainer.addChild(oMsgBox, oTextCongratStruct, oTextEnemyKilledStruct, oTextFinalScoreStruct, oTextTitleStruct, oTextCongrat, oTextEnemyKilled, oTextFinalScore, oTextTitle, oEnemyDied);

        s_oStage.addChild(_oFinishGameContainer);

        createjs.Tween.get(_oFinishGameContainer).to({y: CANVAS_HEIGHT * 0.5}, 1000, createjs.Ease.bounceOut).call(function () {
            var oSpriteRestart = s_oSpriteLibrary.getSprite("but_home");
            _oButReturnToMenu = new CGfxButton((CANVAS_WIDTH / 2), CANVAS_HEIGHT / 2 + 480, oSpriteRestart);
            _oButReturnToMenu.addEventListener(ON_MOUSE_UP, s_oInterface._onButReturnToMenuRelease, this);
        });
        playSound("game_completed", 1, false);
        $(s_oMain).trigger("save_score", iScore);
        $(s_oMain).trigger("share_event", iScore);
    };

    this._onButNextLevelRelease = function () {
        s_oStage.removeChild(_oLevelCompleteContainer);
        _oLevelCompleteContainer = null;

        setVolume("soundtrack", 0.4);

        _oButNextLevel.unload();
        _oButNextLevel = null;
        _oButPause.block(false);
        s_oGame.nextLevel();
    };

    this._onButReturnToMenuRelease = function () {
        s_oGame.onExit();
    };

    this.refreshScore = function (iScore) {
        _oScoreText.text = TEXT_SCORE + " " + iScore;
        _oScoreTextStruct.text = TEXT_SCORE + " " + iScore;
    };

    this.refreshTokenMoney = function (iToken) {
        _oTextMoneyTot.text = iToken + "/" + _iTotCoin;
        _oTextMoneyTotStruct.text = iToken + "/" + _iTotCoin;
    };

    this.setTotCoin = function (iValue) {
        _iTotCoin = iValue;
    };

    this.onButPauseRelease = function () {
        _oPauseBg = createBitmap(s_oSpriteLibrary.getSprite("bg_level"));
        _oPauseBg.on("click",function(){});

        var oPauseText;
        var iSize = 120;

        oPauseText = new createjs.Text(TEXT_PAUSE, "normal " + iSize + "px " + PRIMARY_FONT, "#ffb400");
        oPauseText.textAlign = "center";
        oPauseText.textBaseline = "alphabetic";
        oPauseText.x = CANVAS_WIDTH / 2;
        oPauseText.y = CANVAS_HEIGHT / 2 - 180;

        var oPauseTextStruct;

        oPauseTextStruct = new createjs.Text(TEXT_PAUSE, "normal " + iSize + "px " + PRIMARY_FONT, "#000000");
        oPauseTextStruct.textAlign = "center";
        oPauseTextStruct.textBaseline = "alphabetic";
        oPauseTextStruct.x = CANVAS_WIDTH / 2;
        oPauseTextStruct.y = CANVAS_HEIGHT / 2 - 180;
        oPauseTextStruct.outline = OUTLINE_TEXT * 2;

        _oPauseTextContainer = new createjs.Container();
        _oPauseTextContainer.addChild(_oPauseBg, oPauseTextStruct, oPauseText);
        s_oStage.addChild(_oPauseTextContainer);

        _oButPause.block(true);
        _oButExit.block(true);

        var oSpriteContinue = s_oSpriteLibrary.getSprite('but_continue');
        _oButContinue = new CGfxButton(CANVAS_WIDTH / 2, CANVAS_HEIGHT / 2, oSpriteContinue);
        _oButContinue.addEventListener(ON_MOUSE_UP, this.onButContinueRelease, this);

        s_oGame.pauseEnemyAnimation();

        createjs.Ticker.paused = true;

        s_oGame.setPause(true);
    };

    this.onButContinueRelease = function () {
        _oButContinue.unload();
        _oButContinue = null;
        _oPauseBg.off("click",function(){});

        s_oStage.removeChild(_oPauseTextContainer);
        _oTransBg = false;
        _oPauseTextContainer = null;

        _oButPause.block(false);

        _oButExit.block(false);

        s_oGame.resumeEnemyAnimation();

        createjs.Ticker.paused = false;

        s_oGame.setPause(false);
    };

    this.helpPag1 = function (iLv) {
        var iLevel = iLv;
        var oSpriteHelpBg = s_oSpriteLibrary.getSprite('msg_box');
        if (!_oHelpPanel) {
            _oHelpPanel = createBitmap(oSpriteHelpBg);

            _oHelpPanel.on("click", function () {
                s_oInterface.unloadHelp(iLevel);
            }, null, true);

            s_oStage.addChild(_oHelpPanel);
        }
        var oHelpTitle;
        var oHelpTitleStruct;
        var szHelpText;

        oHelpTitle = new createjs.Text(TEXT_HOW_TO_PLAY, "normal " + 80 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTitle.textAlign = "center";
        oHelpTitle.textBaseline = "alphabetic";
        oHelpTitle.lineWidth = 500;
        oHelpTitle.lineHeight = 50;
        oHelpTitle.x = 0;
        oHelpTitle.y = -215;

        oHelpTitleStruct = new createjs.Text(TEXT_HOW_TO_PLAY, "normal " + 80 + "px " + PRIMARY_FONT, "#000000");
        oHelpTitleStruct.textAlign = "center";
        oHelpTitleStruct.textBaseline = "alphabetic";
        oHelpTitleStruct.lineWidth = 500;
        oHelpTitleStruct.lineHeight = 50;
        oHelpTitleStruct.x = 2;
        oHelpTitleStruct.y = -213;

        _oHelpTitleContainer = new createjs.Container();

        _oHelpTitleContainer.addChild(oHelpTitleStruct, oHelpTitle);


        if (s_bMobile === true) {
            szHelpText = TEXT_HELP_PAGE_1_MOBILE;
            var oHelpHand;
            var oHelpSwipe;

            var oSpriteSwipe = s_oSpriteLibrary.getSprite("swipe");

            oHelpSwipe = createBitmap(oSpriteSwipe);
            oHelpSwipe.regX = oHelpSwipe.width * 0.5;
            oHelpSwipe.regY = oHelpSwipe.height * 0.5;
            oHelpSwipe.x = 0;
            oHelpSwipe.y = -120;

            var oSpriteHand = s_oSpriteLibrary.getSprite("hand_touch");

            oHelpHand = createBitmap(oSpriteHand);
            oHelpHand.regX = oSpriteHand.width * 0.5;
            oHelpHand.regY = oSpriteHand.height * 0.5;
            oHelpHand.x = -120;
            oHelpHand.y = 0;

            _iPosHandX = oHelpHand.x;

            this.handMovement(oHelpHand, oHelpSwipe);

        } else {
            szHelpText = TEXT_HELP_PAGE_1_PC;
            var oHelpKeyboard;
            oHelpKeyboard = createBitmap(s_oSpriteLibrary.getSprite("keyboard"));
            oHelpKeyboard.x = -170;
            oHelpKeyboard.y = -150;
        }

        var oHelpText;
        var oHelpTextStruct;

        oHelpText = new createjs.Text(szHelpText, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpText.textAlign = "center";
        oHelpText.textBaseline = "alphabetic";
        oHelpText.lineWidth = 500;
        oHelpText.lineHeight = 50;
        oHelpText.x = 0;
        oHelpText.y = 250;

        oHelpTextStruct = new createjs.Text(szHelpText, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        oHelpTextStruct.textAlign = "center";
        oHelpTextStruct.textBaseline = "alphabetic";
        oHelpTextStruct.lineWidth = 500;
        oHelpTextStruct.lineHeight = 50;
        oHelpTextStruct.x = 2;
        oHelpTextStruct.y = 252;

        _oHelpContainer = new createjs.Container();
        _oHelpContainer.x = CANVAS_WIDTH * 0.5;
        _oHelpContainer.y = CANVAS_HEIGHT * 0.5;

        if (!s_bMobile)
            _oHelpContainer.addChild(oHelpKeyboard, oHelpTextStruct, oHelpText, _oHelpTitleContainer);
        else
            _oHelpContainer.addChild(oHelpTextStruct, oHelpText, _oHelpTitleContainer, oHelpSwipe, oHelpHand);


        var oSpriteButContinue = s_oSpriteLibrary.getSprite("but_continue");
        _oButContinue = new CGfxButton(CANVAS_WIDTH * 0.5 + 350, CANVAS_HEIGHT * 0.5 + 450, oSpriteButContinue);

        _oButContinue.addEventListenerWithParams(ON_MOUSE_UP, this.onButNextPrevPage, this, {level: iLv, page: 2});

        s_oStage.addChild(_oHelpContainer);
    };

    this.handMovement = function (oHelpHand, oHelpSwipe) {
        oHelpSwipe.x = _iPosHandX - 120;
        oHelpSwipe.scaleX = 1;
        oHelpSwipe.alpha = 1;
        createjs.Tween.get(oHelpSwipe).to({alpha: 0}, 500);
        createjs.Tween.get(oHelpHand).to({x: _iPosHandX + 240}, 1000, createjs.Ease.cubicOut).call(function () {
            oHelpSwipe.x = _iPosHandX + 300;
            oHelpSwipe.scaleX = -1;
            oHelpSwipe.alpha = 1;
            createjs.Tween.get(oHelpSwipe).to({alpha: 0}, 500);
            createjs.Tween.get(oHelpHand).to({x: _iPosHandX}, 1000, createjs.Ease.cubicOut).call(function () {
                s_oInterface.handMovement(oHelpHand, oHelpSwipe);
            });
        });
    };

    this.helpPag2 = function (iLv) {
        var iLevel = iLv;

        _oHelpPanel.on("click", function () {
            s_oInterface.unloadHelp(iLevel);
        }, null, true);

        s_oStage.addChild(_oHelpPanel);

        var oHelpTitle;
        var oHelpTitleStruct;

        oHelpTitle = new createjs.Text(TEXT_HOW_TO_PLAY, "normal " + 80 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTitle.textAlign = "center";
        oHelpTitle.textBaseline = "alphabetic";
        oHelpTitle.lineWidth = 500;
        oHelpTitle.lineHeight = 50;
        oHelpTitle.x = 0;
        oHelpTitle.y = -195;

        oHelpTitleStruct = new createjs.Text(TEXT_HOW_TO_PLAY, "normal " + 80 + "px " + PRIMARY_FONT, "#000000");
        oHelpTitleStruct.textAlign = "center";
        oHelpTitleStruct.textBaseline = "alphabetic";
        oHelpTitleStruct.lineWidth = 500;
        oHelpTitleStruct.lineHeight = 50;
        oHelpTitleStruct.x = 2;
        oHelpTitleStruct.y = -193;

        var oPosHelpTextEnemy = {x: 30, y: -110};

        var oHelpTextEnemy;
        var oHelpTextEnemyStruct;

        oHelpTextEnemy = new createjs.Text(TEXT_HELP_ENEMY, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTextEnemy.textAlign = "center";
        oHelpTextEnemy.textBaseline = "alphabetic";
        oHelpTextEnemy.lineWidth = 500;
        oHelpTextEnemy.lineHeight = 50;
        oHelpTextEnemy.x = oPosHelpTextEnemy.x;
        oHelpTextEnemy.y = oPosHelpTextEnemy.y;

        oHelpTextEnemyStruct = new createjs.Text(TEXT_HELP_ENEMY, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        oHelpTextEnemyStruct.textAlign = "center";
        oHelpTextEnemyStruct.textBaseline = "alphabetic";
        oHelpTextEnemyStruct.lineWidth = 500;
        oHelpTextEnemyStruct.lineHeight = 50;
        oHelpTextEnemyStruct.x = oPosHelpTextEnemy.x + 2;
        oHelpTextEnemyStruct.y = oPosHelpTextEnemy.y + 2;

        var oEnemy;

        var oSpriteEnemyLeftRight = s_oSpriteLibrary.getSprite("enemy_left_right_0");
        var oData = {
            images: [oSpriteEnemyLeftRight],
            // width, height & registration point of each sprite
            frames: {width: oSpriteEnemyLeftRight.width / 9, height: oSpriteEnemyLeftRight.height / 6, regX: (oSpriteEnemyLeftRight.width / 2) / 9 + ENEMY_OFFSET_REG[0].x, regY: (oSpriteEnemyLeftRight.height / 2) / 6 + ENEMY_OFFSET_REG[0].y},
            animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
        };
        var oSpriteSheetHeroLeftRight = new createjs.SpriteSheet(oData);

        oEnemy = createSprite(oSpriteSheetHeroLeftRight, "walk", ((oSpriteEnemyLeftRight.width / 2) / 9) + ENEMY_OFFSET_REG[0].x, ((oSpriteEnemyLeftRight.height / 2) / 6) + ENEMY_OFFSET_REG[0].y, oSpriteEnemyLeftRight.width / 9, oSpriteEnemyLeftRight.height / 6);

        oEnemy.x = -250;
        oEnemy.y = -100;

        var oHelpTextTNT;
        var oHelpTextTNTStruct;
        var oPosHelpTextTNT = {x: -200, y: -10};

        oHelpTextTNT = new createjs.Text(TEXT_HELP_TNT, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTextTNT.textAlign = "left";
        oHelpTextTNT.textBaseline = "alphabetic";
        oHelpTextTNT.lineWidth = 570;
        oHelpTextTNT.lineHeight = 50;
        oHelpTextTNT.x = oPosHelpTextTNT.x;
        oHelpTextTNT.y = oPosHelpTextTNT.y;

        oHelpTextTNTStruct = new createjs.Text(TEXT_HELP_TNT, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        oHelpTextTNTStruct.textAlign = "left";
        oHelpTextTNTStruct.textBaseline = "alphabetic";
        oHelpTextTNTStruct.lineWidth = 570;
        oHelpTextTNTStruct.lineHeight = 50;
        oHelpTextTNTStruct.x = oPosHelpTextTNT.x + 2;
        oHelpTextTNTStruct.y = oPosHelpTextTNT.y + 2;

        var oTNT;
        var iType = 5;
        var oSpriteTNT = s_oSpriteLibrary.getSprite("object_" + iType);
        var oData = {
            images: [oSpriteTNT],
            // width, height & registration point of each sprite
            frames: {width: (oSpriteTNT.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSpriteTNT.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSpriteTNT.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSpriteTNT.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
            animations: OBJECT_SPRITESHEET_NUM[iType].animations
        };
        var oSpriteSheetTNT = new createjs.SpriteSheet(oData);

        oTNT = createSprite(oSpriteSheetTNT, "blink", ((oSpriteTNT.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSpriteTNT.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSpriteTNT.width / OBJECT_SPRITESHEET_NUM[iType].width, oSpriteTNT.height / OBJECT_SPRITESHEET_NUM[iType].height);

        oTNT.x = -250;
        oTNT.y = 0;
        //COIN
        var oHelpTextCoin;
        var oHelpTextCoinStruct;
        var oPosHelpTextCoin = {x: -200, y: 130};

        oHelpTextCoin = new createjs.Text(TEXT_HELP_COIN_PART1 + " " + COIN_SCORE + " " + TEXT_HELP_COIN_PART2, "normal " + 54 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTextCoin.textAlign = "left";
        oHelpTextCoin.textBaseline = "alphabetic";
        oHelpTextCoin.lineWidth = 570;
        oHelpTextCoin.lineHeight = 50;
        oHelpTextCoin.x = oPosHelpTextCoin.x;
        oHelpTextCoin.y = oPosHelpTextCoin.y;

        oHelpTextCoinStruct = new createjs.Text(TEXT_HELP_COIN_PART1 + " " + COIN_SCORE + " " + TEXT_HELP_COIN_PART2, "normal " + 54 + "px " + PRIMARY_FONT, "#000000");
        oHelpTextCoinStruct.textAlign = "left";
        oHelpTextCoinStruct.textBaseline = "alphabetic";
        oHelpTextCoinStruct.lineWidth = 570;
        oHelpTextCoinStruct.lineHeight = 50;
        oHelpTextCoinStruct.x = oPosHelpTextCoin.x + 2;
        oHelpTextCoinStruct.y = oPosHelpTextCoin.y + 2;

        var oCoin;
        var iType = 2;
        var oSpriteCoin = s_oSpriteLibrary.getSprite("object_" + iType);
        var oData = {
            images: [oSpriteCoin],
            // width, height & registration point of each sprite
            frames: {width: (oSpriteCoin.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSpriteCoin.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSpriteCoin.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSpriteCoin.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
            animations: OBJECT_SPRITESHEET_NUM[iType].animations
        };
        var oSpriteSheetCoin = new createjs.SpriteSheet(oData);

        oCoin = createSprite(oSpriteSheetCoin, "normal", ((oSpriteCoin.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSpriteCoin.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSpriteCoin.width / OBJECT_SPRITESHEET_NUM[iType].width, oSpriteCoin.height / OBJECT_SPRITESHEET_NUM[iType].height);

        oCoin.x = -250;
        oCoin.y = 180;
        //SWORD
        var oHelpTextSword;
        var oHelpTextSwordStruct;
        var oPosHelpTextSword = {x: -200, y: 360};

        oHelpTextSword = new createjs.Text(TEXT_HELP_SWORD, "normal " + 60 + "px " + PRIMARY_FONT, "#ffb400");
        oHelpTextSword.textAlign = "left";
        oHelpTextSword.textBaseline = "alphabetic";
        oHelpTextSword.lineWidth = 570;
        oHelpTextSword.lineHeight = 50;
        oHelpTextSword.x = oPosHelpTextSword.x;
        oHelpTextSword.y = oPosHelpTextSword.y;

        oHelpTextSwordStruct = new createjs.Text(TEXT_HELP_SWORD, "normal " + 60 + "px " + PRIMARY_FONT, "#000000");
        oHelpTextSwordStruct.textAlign = "left";
        oHelpTextSwordStruct.textBaseline = "alphabetic";
        oHelpTextSwordStruct.lineWidth = 570;
        oHelpTextSwordStruct.lineHeight = 50;
        oHelpTextSwordStruct.x = oPosHelpTextSword.x + 2;
        oHelpTextSwordStruct.y = oPosHelpTextSword.y + 2;

        var oSword;
        var iType = 3;
        var oSpriteSword = s_oSpriteLibrary.getSprite("object_" + iType);
        var oData = {
            images: [oSpriteSword],
            // width, height & registration point of each sprite
            frames: {width: (oSpriteSword.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSpriteSword.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSpriteSword.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSpriteSword.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
            animations: OBJECT_SPRITESHEET_NUM[iType].animations
        };
        var oSpriteSheetSword = new createjs.SpriteSheet(oData);

        oSword = createSprite(oSpriteSheetSword, "normal", ((oSpriteSword.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSpriteSword.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSpriteSword.width / OBJECT_SPRITESHEET_NUM[iType].width, oSpriteSword.height / OBJECT_SPRITESHEET_NUM[iType].height);

        oSword.x = -250;
        oSword.y = 360;

        _oHelpContainer = new createjs.Container();
        _oHelpContainer.x = CANVAS_WIDTH * 0.5;
        _oHelpContainer.y = CANVAS_HEIGHT * 0.5 - 20;

        _oHelpContainer.addChild(oHelpTextEnemyStruct, oHelpTextEnemy, oEnemy, oHelpTextTNTStruct, oHelpTextTNT, oTNT, oHelpTextCoinStruct, oHelpTextCoin, oCoin, oHelpTextSwordStruct, oHelpTextSword, oSword, oHelpTitleStruct, oHelpTitle);

        var oSpriteButContinue = s_oSpriteLibrary.getSprite("but_continue");
        _oButPrev = new CGfxButton(CANVAS_WIDTH * 0.5 - 350, CANVAS_HEIGHT * 0.5 + 450, oSpriteButContinue);
        _oButPrev.setScaleX(-1);
        _oButPrev.addEventListenerWithParams(ON_MOUSE_UP, this.onButNextPrevPage, this, {level: iLv, page: 1});

        _oButContinue = new CGfxButton(CANVAS_WIDTH * 0.5 + 350, CANVAS_HEIGHT * 0.5 + 450, oSpriteButContinue);
        _oButContinue.addEventListenerWithParams(ON_MOUSE_UP, this.onButNextPrevPage, this, {level: iLv, page: 3});

        s_oStage.addChild(_oHelpContainer);
    };

    this.onButNextPrevPage = function (oInfo) {
        switch (oInfo.page) {
            case 1:
                s_oStage.removeChild(_oHelpContainer);
                _oButPrev.unload();
                _oButContinue.unload();
                this.helpPag1(oInfo.level);
                break;
            case 2:
                s_oStage.removeChild(_oHelpContainer);
                _oButContinue.unload();
                this.helpPag2(oInfo.level);
                break;
            case 3:
                this.unloadHelp(oInfo.level);
                break;
        }
    };


    this.gameOver = function (iScore) {
        s_oGame.setPause(true);

        _oButExit.block(true);

        _oGameOverPanel = createBitmap(s_oSpriteLibrary.getSprite("bg_game_over"));
        _oGameOverPanel.x = -CANVAS_WIDTH * 0.5;
        _oGameOverPanel.y = -CANVAS_HEIGHT * 0.5;
        _oGameOverPanel.on("click",function(){});

        _oGameOverContainer = new createjs.Container();
        var pGameOverPos = {x: 0, y: 150};
        var iSizeFont = 80;
        var oTextGameOver;
        var oTextGameOverStruct;
        var oTextGameOverScore;
        var oTextGameOverScoreStruct;
        var oTextTitle;
        var oTextTitleStruct;

        oTextTitle = new createjs.Text(TEXT_YOU_ARE_DEAD,  iSizeFont + "px " + PRIMARY_FONT, "#ffb400");
        oTextTitle.textAlign = "center";
        oTextTitle.textBaseline = "alphabetic";
        oTextTitle.x = pGameOverPos.x;
        oTextTitle.y = pGameOverPos.y - 400;

        oTextTitleStruct = new createjs.Text(TEXT_YOU_ARE_DEAD, iSizeFont + "px " + PRIMARY_FONT, "#000000");
        oTextTitleStruct.textAlign = "center";
        oTextTitleStruct.textBaseline = "alphabetic";
        oTextTitleStruct.x = pGameOverPos.x;
        oTextTitleStruct.y = pGameOverPos.y - 400;
        oTextTitleStruct.outline = OUTLINE_TEXT;

        oTextGameOver = new createjs.Text(TEXT_GAMEOVER, iSizeFont + "px " + PRIMARY_FONT, "#ffb400");
        oTextGameOver.textAlign = "center";
        oTextGameOver.textBaseline = "alphabetic";
        oTextGameOver.x = pGameOverPos.x;
        oTextGameOver.y = pGameOverPos.y;

        oTextGameOverStruct = new createjs.Text(TEXT_GAMEOVER,  iSizeFont + "px " + PRIMARY_FONT, "#000000");
        oTextGameOverStruct.textAlign = "center";
        oTextGameOverStruct.textBaseline = "alphabetic";
        oTextGameOverStruct.x = pGameOverPos.x;
        oTextGameOverStruct.y = pGameOverPos.y;
        oTextGameOverStruct.outline = OUTLINE_TEXT;

        oTextGameOverScore = new createjs.Text(iScore,  iSizeFont + "px " + PRIMARY_FONT, "#ffb400");
        oTextGameOverScore.textAlign = "center";
        oTextGameOverScore.textBaseline = "alphabetic";
        oTextGameOverScore.x = pGameOverPos.x;
        oTextGameOverScore.y = pGameOverPos.y + 100;

        oTextGameOverScoreStruct = new createjs.Text(iScore,  iSizeFont + "px " + PRIMARY_FONT, "#000000");
        oTextGameOverScoreStruct.textAlign = "center";
        oTextGameOverScoreStruct.textBaseline = "alphabetic";
        oTextGameOverScoreStruct.x = pGameOverPos.x;
        oTextGameOverScoreStruct.y = pGameOverPos.y + 100;
        oTextGameOverScoreStruct.outline = 4;

        _oGameOverContainer.addChild(_oGameOverPanel, oTextGameOverScoreStruct, oTextGameOverStruct, oTextTitleStruct, oTextTitle, oTextGameOver, oTextGameOverScore);

        _oGameOverContainer.x = CANVAS_WIDTH / 2;
        _oGameOverContainer.y = CANVAS_HEIGHT / 2;
        _oGameOverContainer.alpha = 0;

        s_oStage.addChild(_oGameOverContainer);

        createjs.Tween.get(_oGameOverContainer).to({alpha: 1}, 1000, createjs.Ease.cubicOut).call(function () {
            var oSpriteRestart = s_oSpriteLibrary.getSprite("but_restart");
            var oSpriteHome = s_oSpriteLibrary.getSprite("but_home");
            _oButReturnToMenu = new CGfxButton((CANVAS_WIDTH / 2 + 150), CANVAS_HEIGHT / 2 + 390, oSpriteHome);
            _oButReturnToMenu.addEventListener(ON_MOUSE_UP, s_oInterface._onButReturnToMenuRelease, this);
            _oButRestart = new CGfxButton((CANVAS_WIDTH / 2 - 150), CANVAS_HEIGHT / 2 + 390, oSpriteRestart);
            _oButRestart.addEventListener(ON_MOUSE_UP, s_oInterface._onButRestartLevelRelease, this);
        });

        $(s_oMain).trigger("save_score", iScore);
        $(s_oMain).trigger("share_event", iScore);
    };

    this.unloadHelp = function (iLevel) {
        createjs.Tween.get(_oHelpPanel).to({alpha: 0}, 1000, createjs.Ease.cubicOut).call(function () {
            s_oStage.removeChild(_oHelpPanel);
        });
        createjs.Tween.get(_oHelpContainer).to({alpha: 0}, 1000, createjs.Ease.cubicOut).call(function () {
            s_oStage.removeChild(_oHelpContainer);
            s_oInterface.showLevelNum(iLevel);
        });
        if (_oButPrev) {
            _oButPrev.unload();
            _oButPrev = null;
        }
        if (_oButContinue) {
            _oButContinue.unload();
            _oButContinue = null;
        }
        s_oStage.removeChild(_oHelpTitleContainer);
    };

    this._onButRestartLevelRelease = function () {
        _oGameOverPanel.off("click",function(){});
        s_oStage.removeChild(_oGameOverContainer);
        _oButRestart.unload();
        _oButReturnToMenu.unload();
        _oButRestart = null;
        _oButReturnToMenu = null;
        _oGameOver = null;
        _oGameOverContainer = null;
        $(s_oMain).trigger("show_interlevel_ad");
        s_oGame.restartLevelFromGameOver();
        _oButExit.block(false);
    };

    this.showLevelNum = function (iLevel) {
        var iLv = iLevel + 1;

        var oLevelText;
        var oLevelTextCont;
        var pLvPos = {x: -90, y: 0};
        var oLevelContainer;

        oLevelText = new createjs.Text(TEXT_LEVEL + " " + iLv, "normal " + 90 + "px " + PRIMARY_FONT, "#ffffff");
        oLevelText.textAlign = "left";
        oLevelText.textBaseline = "alphabetic";
        oLevelText.x = pLvPos.x;
        oLevelText.y = pLvPos.y;

        oLevelTextCont = new createjs.Text(TEXT_LEVEL + " " + iLv, "normal " + 90 + "px " + PRIMARY_FONT, "#000000");
        oLevelTextCont.textAlign = "left";
        oLevelTextCont.textBaseline = "alphabetic";
        oLevelTextCont.x = pLvPos.x;
        oLevelTextCont.y = pLvPos.y;
        oLevelTextCont.outline = OUTLINE_TEXT + 1;

        oLevelContainer = new createjs.Container();
        oLevelContainer.addChild(oLevelTextCont, oLevelText);
        oLevelContainer.scaleX = 0;
        oLevelContainer.scaleY = 0;
        oLevelContainer.x = CANVAS_WIDTH / 2;
        oLevelContainer.y = CANVAS_HEIGHT / 2;
        s_oStage.addChild(oLevelContainer);

        createjs.Tween.get(oLevelContainer).to({scaleX: 1, scaleY: 1}, 1000, createjs.Ease.elasticOut).call(function () {
            createjs.Tween.get(oLevelContainer).wait(500).to({scaleX: 0, scaleY: 0}, 1000, createjs.Ease.elasticIn).call(function () {
                s_oStage.removeChild(oLevelContainer);
                s_oGame.setPause(false);
                s_oGame.canInput(true);
                s_oGame.startAnimEnemy("walk");
            });
        });
    };

    this.refreshLife = function (iValue) {
        _oLifeText.text = "x" + iValue;
        _oLifeTextStruct.text = "x" + iValue;
    };

    this.numLevel = function (iLevel) {
        var iLv = iLevel + 1;
        _oLevelText.text = TEXT_LEVEL + "\n" + iLv;
    };

    this.unload = function () {

        s_oStage.removeChild(_oTextGameOver, _oButReturnToMenu, _oFade);
        _oTextGameOver = null;
        _oButReturnToMenu = null;
        _oFade = null;

        if (DISABLE_SOUND_MOBILE === false || s_bMobile === false) {
            _oAudioToggle.unload();
            _oAudioToggle = null;
        }
        
        if (_fRequestFullScreen && screenfull.enabled){
            _oButFullscreen.unload();
        }
        s_oInterface = null;
    };

    this.refreshFPS = function () {
        var iFPS = Math.ceil(createjs.Ticker.getMeasuredFPS());
        _oFpsText.text = "FPS:" + iFPS;
        _oFpsTextStruct.text = "FPS:" + iFPS;
    };

    this._onExit = function () {
        s_oGame.onExit();
    };

    this._onAudioToggle = function () {
        Howler.mute(s_bAudioActive);
        s_bAudioActive = !s_bAudioActive;
    };
    
    this.resetFullscreenBut = function(){
	if (_fRequestFullScreen && screenfull.enabled){
		_oButFullscreen.setActive(s_bFullscreen);
	}
    };
    
    this._onFullscreenRelease = function(){
	if(s_bFullscreen) { 
		_fCancelFullScreen.call(window.document);
	}else{
		_fRequestFullScreen.call(window.document.documentElement);
	}
	
	sizeHandler();
    };
    
    s_oInterface = this;

    this._init();

    return this;
}

var s_oInterface = null;