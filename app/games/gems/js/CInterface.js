function CInterface(iLevel, iMoves, iMaxMoves){
    var _oAudioToggle;
    var _oButExit;
    var _oButRestart;
    var _oTextLevelStroke;
    var _oTextLevel;
    var _oTextMovesStroke;
    var _oTextMoves;
    
    var _oHelpPanel=null;
    
    var _pStartPosExit;
    var _pStartPosAudio;
    var _pStartPosRestart;
    var _pStartPosTextLevel;
    var _pStartPosTextMoves;
    this._init = function(iLevel, iMoves, iMaxMoves){                
        var oExitX;        
        
        var oSprite = s_oSpriteLibrary.getSprite('but_exit');
        _pStartPosExit = {x: CANVAS_WIDTH - (oSprite.height/2) - 5, y: (oSprite.height/2) + 10};
        _oButExit = new CGfxButton(_pStartPosExit.x, _pStartPosExit.y, oSprite, s_oStage);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);
        
        oExitX = CANVAS_WIDTH - (oSprite.width/2)- 72;
        
        _pStartPosRestart = {x: oExitX, y: (oSprite.height/2) + 10};
        
        var oSprite = s_oSpriteLibrary.getSprite('but_restart');
        _oButRestart = new CGfxButton(_pStartPosRestart.x, _pStartPosRestart.y, oSprite, s_oStage);
        _oButRestart.addEventListener(ON_MOUSE_UP, this._onRestart, this);
        
        _pStartPosAudio = {x: _pStartPosRestart.x-65, y: (oSprite.height/2) + 10};
        
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            var oSprite = s_oSpriteLibrary.getSprite('audio_icon');
            _oAudioToggle = new CToggle(_pStartPosAudio.x,_pStartPosAudio.y,oSprite,s_bAudioActive);
            _oAudioToggle.addEventListener(ON_MOUSE_UP, this._onAudioToggle, this);          
        }
        
        _pStartPosTextLevel = {x: CANVAS_WIDTH/2-150, y: 56};
        
        _oTextLevelStroke =  new createjs.Text(TEXT_LEVEL + ": "+(iLevel+1)," 50px "+FONT, "#730358");
        _oTextLevelStroke.x = _pStartPosTextLevel.x;
        _oTextLevelStroke.y = _pStartPosTextLevel.y;
        _oTextLevelStroke.textAlign = "center";
        _oTextLevelStroke.textBaseline = "alphabetic";
        _oTextLevelStroke.lineWidth = 500;
        _oTextLevelStroke.outline = 4;
        s_oStage.addChild(_oTextLevelStroke);
        
        _oTextLevel =  new createjs.Text(TEXT_LEVEL+": "+(iLevel+1)," 50px "+FONT, "#ffffff");
        _oTextLevel.x = _pStartPosTextLevel.x;
        _oTextLevel.y = _pStartPosTextLevel.y;
        _oTextLevel.textAlign = "center";
        _oTextLevel.textBaseline = "alphabetic";
        _oTextLevel.lineWidth = 500;
        s_oStage.addChild(_oTextLevel);
        
        _pStartPosTextMoves = {x: CANVAS_WIDTH/2+100, y: CANVAS_HEIGHT-25};
        
        _oTextMovesStroke =  new createjs.Text(TEXT_MOVES + ": "+iMoves+"/"+iMaxMoves," 50px "+FONT, "#730358");
        _oTextMovesStroke.x = _pStartPosTextMoves.x;
        _oTextMovesStroke.y = _pStartPosTextMoves.y;
        _oTextMovesStroke.textAlign = "center";
        _oTextMovesStroke.textBaseline = "alphabetic";
        _oTextMovesStroke.lineWidth = 500;
        _oTextMovesStroke.outline = 4;
        s_oStage.addChild(_oTextMovesStroke);
        
        _oTextMoves =  new createjs.Text(TEXT_MOVES+": "+iMoves+"/"+iMaxMoves," 50px "+FONT, "#ffffff");
        _oTextMoves.x = _pStartPosTextMoves.x;
        _oTextMoves.y = _pStartPosTextMoves.y;
        _oTextMoves.textAlign = "center";
        _oTextMoves.textBaseline = "alphabetic";
        _oTextMoves.lineWidth = 500;
        s_oStage.addChild(_oTextMoves);
        
        this.refreshButtonPos(s_iOffsetX,s_iOffsetY);
    };
    
    this.unload = function(){
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            _oAudioToggle.unload();
            _oAudioToggle = null;
        }
        
        _oButExit.unload();
        
        if(_oHelpPanel!==null){
            _oHelpPanel.unload();
        }
        s_oInterface = null;
    };
    
    this.refreshButtonPos = function(iNewX,iNewY){
        _oButExit.setPosition(_pStartPosExit.x - iNewX,iNewY + _pStartPosExit.y);
        _oButRestart.setPosition(_pStartPosRestart.x - iNewX,iNewY + _pStartPosRestart.y);
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            _oAudioToggle.setPosition(_pStartPosAudio.x - iNewX,iNewY + _pStartPosAudio.y);
        }        
        _oTextLevel.y = _pStartPosTextLevel.y+iNewY;
        _oTextLevelStroke.y = _pStartPosTextLevel.y+iNewY;
        _oTextMoves.y = _pStartPosTextMoves.y-iNewY;
        _oTextMovesStroke.y = _pStartPosTextMoves.y-iNewY;
        
        s_oGame.refreshGridScale();
        
    };
    
    this.refreshScore = function(iMoves){
        _oTextMoves.text = TEXT_MOVES+": "+iMoves+"/"+iMaxMoves;
        _oTextMovesStroke.text = TEXT_MOVES+": "+iMoves+"/"+iMaxMoves;
    };
    
    this._onButHelpRelease = function(){
        _oHelpPanel = new CHelpPanel();
    };
    
    this._onButRestartRelease = function(){
        s_oGame.restartGame();
    };
    
    this.onExitFromHelp = function(){
        _oHelpPanel.unload();
    };
    
    this._onAudioToggle = function(){
        Howler.mute(s_bAudioActive);
        s_bAudioActive = !s_bAudioActive;
        if(s_bMobile && !s_bIsIphone){
            s_oStage.update();
        }
    };
    
    this._onExit = function(){
        s_oGame.onExit();  
      
        $(s_oMain).trigger("end_level");
        $(s_oMain).trigger("show_interlevel_ad");
        $(s_oMain).trigger("end_session");
    };
    
    this._onRestart = function(){
        s_oGame.onRestart();  
    };
    
    s_oInterface = this;
    
    this._init(iLevel, iMoves, iMaxMoves);
    
    return this;
}

var s_oInterface = null;