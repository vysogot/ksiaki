function CEndPanel(oSpriteBg, iLevel, iScore){
    
    var _oBg;
    var _oGroup;
    var _oLevelContainer;
    var _oEndContainer;
    
    var _oMsgTextStroke;
    var _oMsgText;
    var _oMsgScoreStroke;
    var _oMsgScore;
    var _oLevelSprite;
    var _oEndSprite;
    
    this._init = function(oSpriteBg, iLevel, iScore){
        
        $(s_oMain).trigger("end_level",[iLevel]);
        _oBg = createBitmap(oSpriteBg);
        _oBg.x = 0;
        _oBg.y = 0;

        _oGroup = new createjs.Container();
        if(!s_bMobile || s_bIsIphone){
            _oGroup.alpha = 0;
            _oGroup.visible=false;
        }
        _oLevelContainer = new createjs.Container();
        _oEndContainer = new createjs.Container();
        
        _oMsgTextStroke = new createjs.Text(""," 40px "+FONT, "#730358");
        _oMsgTextStroke.x = CANVAS_WIDTH/2;
        _oMsgTextStroke.y = (CANVAS_HEIGHT/2)-120;
        _oMsgTextStroke.textAlign = "center";
        _oMsgTextStroke.textBaseline = "alphabetic";
        _oMsgTextStroke.outline = 4;
        _oMsgTextStroke.lineWidth = 500;  
        
        _oMsgText = new createjs.Text(""," 40px "+FONT, "#ffffff");
        _oMsgText.x = CANVAS_WIDTH/2;
        _oMsgText.y = (CANVAS_HEIGHT/2)-120;
        _oMsgText.textAlign = "center";
        _oMsgText.textBaseline = "alphabetic";
        _oMsgText.lineWidth = 500;        
        
        _oMsgScoreStroke = new createjs.Text(""," 40px "+FONT, "#730358");
        _oMsgScoreStroke.x = CANVAS_WIDTH/2;
        _oMsgScoreStroke.y = (CANVAS_HEIGHT/2)-50;
        _oMsgScoreStroke.textAlign = "center";
        _oMsgScoreStroke.textBaseline = "alphabetic";
        _oMsgScoreStroke.outline = 4;
        _oMsgScoreStroke.lineWidth = 500;  
        
        _oMsgScore = new createjs.Text(""," 40px "+FONT, "#ffffff");
        _oMsgScore.x = CANVAS_WIDTH/2;
        _oMsgScore.y = (CANVAS_HEIGHT/2)-50;
        _oMsgScore.textAlign = "center";
        _oMsgScore.textBaseline = "alphabetic";
        _oMsgScore.lineWidth = 500;        
        
        _oLevelSprite = createBitmap(s_oSpriteLibrary.getSprite('but_next'));
        _oLevelSprite.x = CANVAS_WIDTH/2+30;
        _oLevelSprite.y = CANVAS_HEIGHT/2;
        _oLevelContainer.addChild(_oLevelSprite);
        
        _oEndSprite = createBitmap(s_oSpriteLibrary.getSprite('but_restart_big'));
        _oEndSprite.x = CANVAS_WIDTH/2-140;
        _oEndSprite.y = CANVAS_HEIGHT/2;
        _oEndContainer.addChild(_oEndSprite);
        
        _oEndContainer.on("mousedown", this._onExit, this);
        
        _oGroup.addChild(_oBg, _oMsgTextStroke, _oMsgText, _oMsgScoreStroke, _oMsgScore, _oEndContainer);

        s_oStage.addChild(_oGroup);
    };
    
    this._onNextLevel = function(event){
        s_oStage.removeChild(_oGroup);
        $(s_oMain).trigger("show_interlevel_ad");
        _oLevelContainer.off("mousedown", this._onNextLevel, this);
        s_oGame.nextLevel();
        
    };
    
    this.nextLevel = function(){
        playSound("next_level", 1, false);
        
        _oMsgTextStroke.text = TEXT_LEVEL_COMPLETED;
        _oMsgText.text = TEXT_LEVEL_COMPLETED;
        
        _oMsgScoreStroke.text = TEXT_SCORE+iScore;
        _oMsgScore.text = TEXT_SCORE+iScore;
        
        _oGroup.addChild(_oLevelContainer);
        _oLevelContainer.on("mousedown", this._onNextLevel, this);
        
        _oGroup.visible = true;
        
        if(!s_bMobile || s_bIsIphone){
            createjs.Tween.get(_oGroup).wait(400).to({alpha:1 }, 500).call(function() {});
        }
        
        $(s_oMain).trigger("save_score",[iScore]);
        $(s_oMain).trigger("share_event",[iScore]);
	if(s_bMobile && !s_bIsIphone){
            s_oStage.update();
        }
    };
    
    this.lastLevelCompleted = function(){
        playSound("all_level_completed", 1, false);
        
        _oMsgTextStroke.font = " 30px "+FONT;
        _oMsgText.font = " 30px "+FONT;
        
        _oMsgTextStroke.text = TEXT_WIN1+"\n"+TEXT_WIN2;
        _oMsgText.text = TEXT_WIN1+"\n"+TEXT_WIN2;
        
        _oEndSprite.x = CANVAS_WIDTH/2-50;
        _oEndSprite.y = CANVAS_HEIGHT/2+20;
        
        _oGroup.visible = true;
        
        if(!s_bMobile || s_bIsIphone){
            createjs.Tween.get(_oGroup).wait(400).to({alpha:1 }, 500).call(function() {});
        }
        
        $(s_oMain).trigger("save_score",[iScore]);
        $(s_oMain).trigger("share_event",[iScore]);
	if(s_bMobile && !s_bIsIphone){
            s_oStage.update();
        }
    };
    
    this._onExit = function(){
        _oGroup.off("mousedown",this._onExit);
        s_oStage.removeChild(_oGroup);
        
        s_oGame.onRestart();
        
        $(s_oMain).trigger("end_level");
        $(s_oMain).trigger("show_interlevel_ad");
        $(s_oMain).trigger("end_session");
    };
    
    this._init(oSpriteBg, iLevel, iScore);
    
    return this;
}
