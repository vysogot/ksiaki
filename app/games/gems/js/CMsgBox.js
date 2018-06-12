function CMsgBox(){
    
    var _oConfirmCB;
    
    var _oBg;
    var _oGroup;
    
    var _oMsgTextStroke;
    var _oMsgText;
    var _oButConfirm;
    var _oButExit;
    var _oParent;
    
    this._init = function(){
        var oSprite = s_oSpriteLibrary.getSprite('msg_box');
        _oBg = createBitmap(oSprite);

        _oGroup = new createjs.Container();
        _oGroup.on("mousedown", function(){});
        
        var iSize = 30;
        
        _oMsgTextStroke = new createjs.Text("",iSize+"px "+FONT, "#730358");
        _oMsgTextStroke.x = CANVAS_WIDTH/2;
        _oMsgTextStroke.y = (CANVAS_HEIGHT/2)-50;
        _oMsgTextStroke.textAlign = "center";
        _oMsgTextStroke.textBaseline = "middle";
        _oMsgTextStroke.outline = 3;
        _oMsgTextStroke.lineWidth = 450; 
        _oMsgTextStroke.lineHeight = iSize;
        
        _oMsgText = new createjs.Text("",iSize+"px "+FONT, "#ffffff");
        _oMsgText.x = CANVAS_WIDTH/2;
        _oMsgText.y = (CANVAS_HEIGHT/2)-50;
        _oMsgText.textAlign = "center";
        _oMsgText.textBaseline = "middle";
        _oMsgText.lineWidth = 450;        
        _oMsgText.lineHeight = iSize;

        _oGroup.addChild(_oBg, _oMsgTextStroke, _oMsgText);

        var oSprite = s_oSpriteLibrary.getSprite('but_exit');
        _oButExit = new CGfxButton(CANVAS_WIDTH/2 + 210, 340, oSprite, _oGroup);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);
        
        var oSprite = s_oSpriteLibrary.getSprite('but_next');
        _oButConfirm = new CGfxButton(CANVAS_WIDTH/2, 570, oSprite, _oGroup);
        _oButConfirm.addEventListener(ON_MOUSE_UP, this._onConfirm, this);

        s_oStage.addChild(_oGroup);
    };

    this.unload = function(){
        _oGroup.off("mousedown",function(){});
        
        s_oStage.removeChild(_oGroup);
    };

    this.setMessage = function(szMessage){
        _oMsgTextStroke.text = szMessage;
        _oMsgText.text = szMessage;
    };

    this.disableConfirm = function(){
        _oButConfirm.setVisible(false);
    };

    this.setConfirm = function(oCallBack){
        _oConfirmCB = oCallBack;
    };

    this._onConfirm = function(){
        if(_oConfirmCB){
            _oConfirmCB();
        }   
    };
    
    this._onExit = function(){
        _oParent.unload();
    };
    
    this._init();
    
    _oParent = this;
    return this;
}



