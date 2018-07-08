function CCredits() {

	// KSIAKI
    var _0xa4e8 = ["_init", "drawRect", "black", "beginFill", "graphics", "alpha", "mousedown", "on", "addChild", "to", "get", "Tween", "msg_box", "getSprite", "regX", "width", "regY", "height", "x", "y", " 40px ", "#000", "textAlign", "center", "textBaseline", "middle", "lineWidth", "outline", "Pink", 
	    CREDITS_LINK, "logo_ctl", "but_exit", "unload", "addEventListener", "removeChild", "call", "off", "_onLogoButRelease", 
	    CREDITS_LINK, "open", "_onMoreGamesReleased", 
	    CREDITS_LINK
    ];

    var _oFade;
    var _oPanelContainer;
    var _oBg;
    var _oButExit;
    var _oLogo;
    var _pStartPanelPos;

    this[_0xa4e8[0]] = function() {
        _oFade = new createjs.Shape;
        _oFade[_0xa4e8[4]][_0xa4e8[3]](_0xa4e8[2])[_0xa4e8[1]](0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
        _oFade[_0xa4e8[5]] = 0;
        _oFade[_0xa4e8[7]](_0xa4e8[6], function() {});
        s_oStage[_0xa4e8[8]](_oFade);
        createjs[_0xa4e8[11]][_0xa4e8[10]](_oFade)[_0xa4e8[9]]({
            alpha: .7
        }, 500);
        _oPanelContainer = new createjs.Container;
        s_oStage[_0xa4e8[8]](_oPanelContainer);
        var _0xf4c2x7 = s_oSpriteLibrary[_0xa4e8[13]](_0xa4e8[12]);
        _oBg = createBitmap(_0xf4c2x7);
        _oBg[_0xa4e8[7]](_0xa4e8[6], this._onLogoButRelease);
        _oBg[_0xa4e8[14]] = _0xf4c2x7[_0xa4e8[15]] / 2;
        _oBg[_0xa4e8[16]] = _0xf4c2x7[_0xa4e8[17]] / 2;
        _oPanelContainer[_0xa4e8[8]](_oBg);
        _oPanelContainer[_0xa4e8[18]] = CANVAS_WIDTH / 2;
        _oPanelContainer[_0xa4e8[19]] = CANVAS_HEIGHT / 2;
        _oPanelContainer[_0xa4e8[5]] = 0;
        _pStartPanelPos = {
            x: _oPanelContainer[_0xa4e8[18]],
            y: _oPanelContainer[_0xa4e8[19]]
        };
        createjs[_0xa4e8[11]][_0xa4e8[10]](_oPanelContainer)[_0xa4e8[9]]({
            alpha: 1
        }, 500);
        var _0xf4c2x8 = new createjs.Text(TEXT_DEVELOPED,_0xa4e8[20] + FONT_GAME,_0xa4e8[21]);
        _0xf4c2x8[_0xa4e8[19]] = -100;
        _0xf4c2x8[_0xa4e8[22]] = _0xa4e8[23];
        _0xf4c2x8[_0xa4e8[24]] = _0xa4e8[25];
        _0xf4c2x8[_0xa4e8[26]] = 500;
        _0xf4c2x8[_0xa4e8[27]] = 4;
        _oPanelContainer[_0xa4e8[8]](_0xf4c2x8);
        var _0xf4c2x9 = new createjs.Text(TEXT_DEVELOPED,_0xa4e8[20] + FONT_GAME,_0xa4e8[28]);
        _0xf4c2x9[_0xa4e8[19]] = -100;
        _0xf4c2x9[_0xa4e8[22]] = _0xa4e8[23];
        _0xf4c2x9[_0xa4e8[24]] = _0xa4e8[25];
        _0xf4c2x9[_0xa4e8[26]] = 500;
        _oPanelContainer[_0xa4e8[8]](_0xf4c2x9);
        var _0xf4c2xa = new createjs.Text(_0xa4e8[29],_0xa4e8[20] + FONT_GAME,_0xa4e8[21]);
        _0xf4c2xa[_0xa4e8[19]] = 100;
        _0xf4c2xa[_0xa4e8[22]] = _0xa4e8[23];
        _0xf4c2xa[_0xa4e8[24]] = _0xa4e8[25];
        _0xf4c2xa[_0xa4e8[26]] = 500;
        _0xf4c2xa[_0xa4e8[27]] = 4;
        _oPanelContainer[_0xa4e8[8]](_0xf4c2xa);
        var _0xf4c2xb = new createjs.Text(_0xa4e8[29],_0xa4e8[20] + FONT_GAME,_0xa4e8[28]);
        _0xf4c2xb[_0xa4e8[19]] = 100;
        _0xf4c2xb[_0xa4e8[22]] = _0xa4e8[23];
        _0xf4c2xb[_0xa4e8[24]] = _0xa4e8[25];
        _0xf4c2xb[_0xa4e8[26]] = 500;
        _oPanelContainer[_0xa4e8[8]](_0xf4c2xb);
        var _0xf4c2x7 = s_oSpriteLibrary[_0xa4e8[13]](_0xa4e8[30]);
        _oLogo = createBitmap(_0xf4c2x7);
        _oLogo[_0xa4e8[14]] = _0xf4c2x7[_0xa4e8[15]] / 2;
        _oLogo[_0xa4e8[16]] = _0xf4c2x7[_0xa4e8[17]] / 2;
        _oPanelContainer[_0xa4e8[8]](_oLogo);
        var _0xf4c2x7 = s_oSpriteLibrary[_0xa4e8[13]](_0xa4e8[31]);
        _oButExit = new CGfxButton(315,-160,_0xf4c2x7,_oPanelContainer);
        _oButExit[_0xa4e8[33]](ON_MOUSE_UP, this[_0xa4e8[32]], this)
    };
    this[_0xa4e8[32]] = function() {
        createjs[_0xa4e8[11]][_0xa4e8[10]](_oFade)[_0xa4e8[9]]({
            alpha: 0
        }, 500);
        createjs[_0xa4e8[11]][_0xa4e8[10]](_oPanelContainer)[_0xa4e8[9]]({
            alpha: 0
        }, 500)[_0xa4e8[35]](function() {
            s_oStage[_0xa4e8[34]](_oFade);
            s_oStage[_0xa4e8[34]](_oPanelContainer);
            _oButExit[_0xa4e8[32]]()
        });
        _oFade[_0xa4e8[36]](_0xa4e8[6], function() {});
        _oBg[_0xa4e8[36]](_0xa4e8[6], this._onLogoButRelease)
    };
    this[_0xa4e8[37]] = function() {
        window[_0xa4e8[39]](_0xa4e8[38])
    };
    this[_0xa4e8[40]] = function() {
        window[_0xa4e8[39]](_0xa4e8[41])
    };
    this._init()

};


