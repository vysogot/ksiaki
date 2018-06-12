function CModeMenu(oData){
    
    var _oButEasy;
    var _oButMedium;
    var _oButHard;
    var _oButExit;
    var _oAudioToggle;
    var _oButFullscreen;
    
    var _aData;
    
    var _fRequestFullScreen = null;
    var _fCancelFullScreen = null;
    
    var _pStartPosExit;
    var _pStartPosAudio;
    var _pStartPosFullscreen;
    
    this._init = function(oData){
        
        var oBg = createBitmap(s_oSpriteLibrary.getSprite('bg_game'));
        s_oStage.addChild(oBg);
        
        var oTitleTextStroke = new createjs.Text(TEXT_SELECT_DIFFICULTY," 50px "+FONT, "#730358");
        oTitleTextStroke.x = CANVAS_WIDTH/2;
        oTitleTextStroke.y = 160;
        oTitleTextStroke.textAlign = "center";
        oTitleTextStroke.textBaseline = "alphabetic";
        oTitleTextStroke.lineWidth = 1000;
        oTitleTextStroke.outline = 4;
        s_oStage.addChild(oTitleTextStroke);
        
        var oTitleText = new createjs.Text(TEXT_SELECT_DIFFICULTY," 50px "+FONT, "#ffffff");
        oTitleText.x = oTitleTextStroke.x;
        oTitleText.y = oTitleTextStroke.y;
        oTitleText.textAlign = "center";
        oTitleText.textBaseline = "alphabetic";
        oTitleText.lineWidth = 1000;
        s_oStage.addChild(oTitleText);
        
        var oExitX;        
        
        var oSprite = s_oSpriteLibrary.getSprite('but_exit');
        _pStartPosExit = {x: CANVAS_WIDTH - (oSprite.height/2)- 5, y: (oSprite.height/2) + 10};
        _oButExit = new CGfxButton(_pStartPosExit.x, _pStartPosExit.y, oSprite, s_oStage);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);
        
        oExitX = CANVAS_WIDTH - (oSprite.width/2)- 73;
        _pStartPosAudio = {x: oExitX, y: (oSprite.height/2) + 8};
        
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            var oSprite = s_oSpriteLibrary.getSprite('audio_icon');
            _oAudioToggle = new CToggle(_pStartPosAudio.x,_pStartPosAudio.y,oSprite,s_bAudioActive);
            _oAudioToggle.addEventListener(ON_MOUSE_UP, this._onAudioToggle, this);          
        }
        
        var doc = window.document;
        var docEl = doc.documentElement;
        _fRequestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;
        _fCancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;
        
        if(ENABLE_FULLSCREEN === false){
            _fRequestFullScreen = false;
        }
        
        if (_fRequestFullScreen && screenfull.enabled){
            oSprite = s_oSpriteLibrary.getSprite('but_fullscreen');
            _pStartPosFullscreen = {x:oSprite.height/2 + 7,y:oSprite.height/2 + 10};

            _oButFullscreen = new CToggle(_pStartPosFullscreen.x,_pStartPosFullscreen.y,oSprite,s_bFullscreen,s_oStage);
            _oButFullscreen.addEventListener(ON_MOUSE_UP, this._onFullscreenRelease, this);
        }
        
        this._splitData();
        
        var oSprite = s_oSpriteLibrary.getSprite('mode_easy_icon');
        _oButEasy = new CGfxButton(CANVAS_WIDTH/2, 300, oSprite, s_oStage);
        _oButEasy.addEventListener(ON_MOUSE_UP, this._onEasy, this);
        
        var oSprite = s_oSpriteLibrary.getSprite('mode_medium_icon');
        _oButMedium = new CGfxButton(CANVAS_WIDTH/2, 500, oSprite, s_oStage);
        _oButMedium.addEventListener(ON_MOUSE_UP, this._onMedium, this);
        
        var oSprite = s_oSpriteLibrary.getSprite('mode_hard_icon');
        _oButHard = new CGfxButton(CANVAS_WIDTH/2, 700, oSprite, s_oStage);
        _oButHard.addEventListener(ON_MOUSE_UP, this._onHard, this);
        
        this.refreshButtonPos(s_iOffsetX,s_iOffsetY);
    };
    
    this.unload = function(){   
        _oButExit.unload();
        
        if (_fRequestFullScreen && screenfull.enabled){
            _oButFullscreen.unload();
        }
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            _oAudioToggle.unload();
        }  
        s_oModeMenu = null; 
        
        _oButEasy.unload();
        _oButMedium.unload();
        _oButHard.unload();
        
        s_oStage.removeAllChildren(); 
    };
    
    this._splitData = function(){
        _aData = new Array();
        _aData[DIFFICULTY_EASY] = new Array();
        _aData[DIFFICULTY_MEDIUM] = new Array();
        _aData[DIFFICULTY_HARD] = new Array();
        
        for(var i=0; i<NUM_LEVELS; i++){
            _aData[s_aLevelsData[i].diff].push( s_aLevelsData[i] );
        }
        
    };
    
    this._onEasy = function(){
        new CLevelMenu(_aData[DIFFICULTY_EASY]);
    };
    
    this._onMedium = function(){
        new CLevelMenu(_aData[DIFFICULTY_MEDIUM]);
    };
    
    this._onHard = function(){
        new CLevelMenu(_aData[DIFFICULTY_HARD]);
    };
    
    this.refreshButtonPos = function(iNewX,iNewY){
        _oButExit.setPosition(_pStartPosExit.x - iNewX,iNewY + _pStartPosExit.y);
        if(DISABLE_SOUND_MOBILE === false || s_bMobile === false){
            _oAudioToggle.setPosition(_pStartPosAudio.x - iNewX,iNewY + _pStartPosAudio.y);
        }        
        if (_fRequestFullScreen && screenfull.enabled){
            _oButFullscreen.setPosition(_pStartPosFullscreen.x + iNewX,_pStartPosFullscreen.y + iNewY);
        }
    };
    
    this._onAudioToggle = function(){
        Howler.mute(s_bAudioActive);
        s_bAudioActive = !s_bAudioActive;
    };
    
    this._onExit = function(){
        s_oModeMenu.unload();
        s_oMain.gotoMenu();
        $(s_oMain).trigger("end_level");
        $(s_oMain).trigger("show_interlevel_ad");
        $(s_oMain).trigger("end_session");
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
    
    
    
    this._init(oData);
    s_oModeMenu = this;
};

var s_oModeMenu = null;
