function CLevelMenu() {

    var _bNumActive;

    var _oLevelTextContainer;
    var _aLevels = new Array();
    var _oModeNumOff;
    var _oModeNumOn;

    var _oBg;
    var _oButExit;
    var _oAudioToggle;

    var _oFade;

    var _pStartPosExit;
    var _pStartPosAudio;

    this._init = function () {
        _oBg = createBitmap(s_oSpriteLibrary.getSprite('bg_menu'));
        _oBg.x = 0;
        _oBg.y = 0;
        s_oStage.addChild(_oBg);

        _bNumActive = false;

        _oBg = createBitmap(s_oSpriteLibrary.getSprite('bg_level'));
        s_oStage.addChild(_oBg);

        _oLevelTextContainer = new createjs.Container();
        _oLevelTextContainer.x = 0;
        _oLevelTextContainer.y = 0;
        
        var iY=490;
        var oLevelText;

        oLevelText = new createjs.Text(TEXT_SELECT_A_LEVEL, " 70px " + PRIMARY_FONT, "#ffb400");
        oLevelText.x = CANVAS_WIDTH / 2;
        oLevelText.y = iY;
        oLevelText.textAlign = "center";
        oLevelText.textBaseline = "alphabetic";
        oLevelText.lineWidth = 1000;

        var oLevelTextStruct;

        oLevelTextStruct = new createjs.Text(TEXT_SELECT_A_LEVEL, " 70px " + PRIMARY_FONT, "#000000");
        oLevelTextStruct.x = CANVAS_WIDTH / 2;
        oLevelTextStruct.y = iY;
        oLevelTextStruct.textAlign = "center";
        oLevelTextStruct.textBaseline = "alphabetic";
        oLevelTextStruct.lineWidth = 1000;
        oLevelTextStruct.outline = OUTLINE_TEXT;

        _oLevelTextContainer.addChild(oLevelTextStruct, oLevelText);
        
        s_oStage.addChild(_oLevelTextContainer);
        
        var oModePos = {x: CANVAS_WIDTH * 0.5 - 20, y: 425};

        var offset_x = -50;
        var offset_y = 170;

        for (var i = 0; i < FLOOR_LEVEL_POSITION.length; i++, offset_x += 135) {
            if (offset_x > 550) {
                offset_x = -50;
                offset_y += 150;
            }

            if (i < s_iLevelReached) {
                _aLevels[i] = new CLevelBut((oModePos.x - 200) + offset_x, oModePos.y + offset_y, s_oSpriteLibrary.getSprite('but_level'), true, i + 1);
                _aLevels[i].addEventListenerWithParams(ON_MOUSE_DOWN, this._onClick, this, i);
            } else {
                _aLevels[i] = new CLevelBut((oModePos.x - 200) + offset_x, oModePos.y + offset_y, s_oSpriteLibrary.getSprite('but_level'), false, i + 1);
            }

            s_bFirstTime = true;
        }
        var oButtonX;

        if (DISABLE_SOUND_MOBILE === false || s_bMobile === false) {
            var oSprite = s_oSpriteLibrary.getSprite('icon_audio');
            oButtonX = CANVAS_WIDTH - (oSprite.width / 2) - 60;
            _pStartPosAudio = {x: oButtonX, y: (oSprite.height / 2) + 20};
            _oAudioToggle = new CToggle(_pStartPosAudio.x, _pStartPosAudio.y, oSprite, s_bAudioActive);
            _oAudioToggle.addEventListener(ON_MOUSE_UP, this._onAudioToggle, this);
        }

        var oSpriteExit = s_oSpriteLibrary.getSprite('but_exit');
        oButtonX = CANVAS_WIDTH - (oSpriteExit.width / 2) - 100;
        _pStartPosExit = {x: oButtonX + 85, y: (oSpriteExit.height / 2) + 20};
        _oButExit = new CGfxButton(_pStartPosExit.x, _pStartPosExit.y, oSpriteExit);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);

        _oFade = new createjs.Shape();
        _oFade.graphics.beginFill("black").drawRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);

        s_oStage.addChild(_oFade);

        createjs.Tween.get(_oFade).to({alpha: 0}, 1000).call(function () {
            s_oStage.removeChild(_oFade);
        });

        this.refreshButtonPos(s_iOffsetX, s_iOffsetY);

    };

    this.unload = function () {
        for (var i = 0; i < FLOOR_LEVEL_POSITION.length; i++) {
            _aLevels[i].unload();
        }
        s_oLevelMenu = null;
        s_oStage.removeAllChildren();
    };

    this.refreshButtonPos = function (iNewX, iNewY) {
        if (DISABLE_SOUND_MOBILE === false || s_bMobile === false) {
            _oAudioToggle.setPosition(_pStartPosAudio.x - iNewX, _pStartPosAudio.y + iNewY);
        }
        _oButExit.setPosition(_pStartPosExit.x - iNewX, _pStartPosExit.y + iNewY);
    };

    this._onNumModeToggle = function (iData) {
        if (iData === NUM_ACTIVE) {
            _bNumActive = true;
            _oModeNumOff.setActive(false);
            _oModeNumOn.setActive(true);

        } else {
            _bNumActive = false;
            _oModeNumOff.setActive(true);
            _oModeNumOn.setActive(false);
        }
    };

    this._onAudioToggle = function () {
        Howler.mute(s_bAudioActive);
        s_bAudioActive = !s_bAudioActive;
    };

    this._onClick = function (i) {
        var level = i;
        var clickable = _aLevels[i].ifClickable();
        if (clickable) {
            s_oLevelMenu.unload();
            s_oMain.gotoGame(level);
        }
    };

    this._onExit = function () {
        s_oLevelMenu.unload();
        s_oMain.gotoMenu();
    };


    s_oLevelMenu = this;
    this._init();

}
;

var s_oLevelMenu = null;