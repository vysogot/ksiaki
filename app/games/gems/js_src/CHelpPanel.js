function CHelp(iLevel){
    var _iLevel = iLevel ;
    var _oBg;
    var _oGroup;
    var _oHelp;
    
    var _oTitleTextOutline;
    var _oTitleText;
    var _oHelpTextOutline;
    var _oHelpText;

    
    this._init = function(iLevel){        
        _oBg = createBitmap(s_oSpriteLibrary.getSprite('bg_game'));
        _oBg.x = 0;
        _oBg.y = 0;
             
        _oHelp = createBitmap(s_oSpriteLibrary.getSprite('bg_help'));
        _oHelp.x = 0;
        _oHelp.y = 0;
        
        _oTitleTextOutline = new createjs.Text(TEXT_HELP_TITLE," 50px "+FONT, "#730358");
        _oTitleTextOutline.x = CANVAS_WIDTH/2;
        _oTitleTextOutline.y = (CANVAS_HEIGHT/2-230);
        _oTitleTextOutline.textAlign = "center";
        _oTitleTextOutline.textBaseline = "alphabetic";
        _oTitleTextOutline.outline = 4;
        _oTitleTextOutline.lineWidth = 470;
        
        _oTitleText = new createjs.Text(TEXT_HELP_TITLE," 50px "+FONT, "#ffd800");
        _oTitleText.x = CANVAS_WIDTH/2;
        _oTitleText.y = (CANVAS_HEIGHT/2-230);
        _oTitleText.textAlign = "center";
        _oTitleText.textBaseline = "alphabetic";
        _oTitleText.lineWidth = 470;
        
        var iSize = 38;
        
        _oHelpTextOutline = new createjs.Text(TEXT_HELP, " "+iSize+"px "+FONT, "#730358");
        _oHelpTextOutline.x = CANVAS_WIDTH/2;
        _oHelpTextOutline.y = (CANVAS_HEIGHT/2+80);
        _oHelpTextOutline.textAlign = "center";
        _oHelpTextOutline.textBaseline = "alphabetic";
        _oHelpTextOutline.outline = 4;
        _oHelpTextOutline.lineWidth = 470;
        _oHelpTextOutline.lineHeight = iSize;
        
        _oHelpText = new createjs.Text(TEXT_HELP,iSize+"px "+FONT, "#ffffff");
        _oHelpText.x = CANVAS_WIDTH/2;
        _oHelpText.y = (CANVAS_HEIGHT/2+80);
        _oHelpText.textAlign = "center";
        _oHelpText.textBaseline = "alphabetic";
        _oHelpText.lineWidth = 470;
        _oHelpText.lineHeight = iSize;

        _oGroup = new createjs.Container();
        
        _oGroup.addChild(_oBg,  _oHelp, _oTitleTextOutline, _oTitleText, _oHelpTextOutline, _oHelpText);

        
        _oGroup.alpha = 0;
        _oGroup.on("mousedown", this._onExit);
        s_oStage.addChild(_oGroup);
        
        var oParent = this;
        createjs.Tween.get(_oGroup).to({alpha:1 }, 500).call(function() {});
    };
    
    
    this._onExit = function(){
        _oGroup.off("mousedown", this._onExit);
        s_oStage.removeChild(_oGroup);
        s_oMain.gotoGame(iLevel, 0);
    };
    
    this._init(iLevel);
    
    return this;
}
