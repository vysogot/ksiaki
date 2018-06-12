function CLevelMenu(oData){
    
    var _bNumActive;
    
    var _iHeightToggle;
    var _iCurPage;
    
    var _aPointsX;
    var _aContainerPage;
    var _aLevelButs;
    
    var _oLevelText;
    var _oModeNumOff;
    var _oModeNumOn;  
    var _oArrowRight = null;
    var _oArrowLeft = null;
    var _oContainer;
    var _oButExit;
    
    var _pStartPosRight;
    var _pStartPosLeft;
    
    this._init = function(){  
        _iCurPage = 0;
        
        _bNumActive = false;
        
        _oContainer = new createjs.Container();
        s_oStage.addChild(_oContainer);
        
        var oBg = createBitmap(s_oSpriteLibrary.getSprite('msg_box'));
        oBg.on("mousedown", function(){});
        _oContainer.addChild(oBg);
        
        _oLevelText = new createjs.Text(TEXT_SELECT_LEVEL," 50px "+FONT, "#730358");
        _oLevelText.x = CANVAS_WIDTH/2;
        _oLevelText.y = 360;
        _oLevelText.textAlign = "center";
        _oLevelText.textBaseline = "alphabetic";
        _oLevelText.lineWidth = 1000;
        _oLevelText.outline = 4;
        _oContainer.addChild(_oLevelText);
        
        _oLevelText = new createjs.Text(TEXT_SELECT_LEVEL," 50px "+FONT, "#ffffff");
        _oLevelText.x = CANVAS_WIDTH/2;
        _oLevelText.y = 360;
        _oLevelText.textAlign = "center";
        _oLevelText.textBaseline = "alphabetic";
        _oLevelText.lineWidth = 1000;
        _oContainer.addChild(_oLevelText);

        var oSprite = s_oSpriteLibrary.getSprite('but_exit');
        _oButExit = new CGfxButton(535,335, oSprite, s_oStage);
        _oButExit.addEventListener(ON_MOUSE_UP, this._onExit, this);

        _iHeightToggle = 50;
       
        //FIND X COORDINATES FOR LEVEL BUTS
        _aPointsX = new Array();
        var iWidth = CANVAS_WIDTH - (EDGEBOARD_X*2) ;
        var iOffsetX = Math.floor(iWidth/NUM_COLS_PAGE_LEVEL)/2;
        var iXPos = 0;
        for(var i=0;i<NUM_COLS_PAGE_LEVEL;i++){
            _aPointsX.push(iXPos);
            iXPos += iOffsetX*2;
        }
        
        _aContainerPage = new Array();
        _aLevelButs = new Array();
        this._createNewLevelPage(0,oData.length);
        
        if(_aContainerPage.length > 1){
            //MULTIPLE PAGES
            for(var k=1;k<_aContainerPage.length;k++){
                _aContainerPage[k].visible = false;
            }
            
            _pStartPosRight = {x:CANVAS_WIDTH - 80,y:CANVAS_HEIGHT - 160};
            _oArrowRight = new CGfxButton(_pStartPosRight.x,_pStartPosRight.y,s_oSpriteLibrary.getSprite('arrow_right'),s_oStage);
            _oArrowRight.addEventListener(ON_MOUSE_UP, this._onRight, this);
            
            _pStartPosLeft = {x:80,y:CANVAS_HEIGHT - 160};
            _oArrowLeft = new CGfxButton(_pStartPosLeft.x,_pStartPosLeft.y,s_oSpriteLibrary.getSprite('arrow_left'),s_oStage);
            _oArrowLeft.addEventListener(ON_MOUSE_UP, this._onLeft, this);
        }

    };  
    
    this.unload = function(){
        for(var i = 0; i < oData.length; i++ ){
            _aLevelButs[i].unload();
        }
        _oButExit.unload();
        
        if(_aContainerPage.length > 1){
            _oArrowRight.unload();
            _oArrowLeft.unload();
        }
        
        _oContainer.removeAllChildren();

    };

    this._checkBoundLimits = function(){
        var oSprite = s_oSpriteLibrary.getSprite('level_sprite');
        var iY = 0;
        
        var iHeightBound = CANVAS_HEIGHT - (EDGEBOARD_Y*2) - (_iHeightToggle * 2);
        var iNumRows = 0;

        while(iY < iHeightBound){
            iY += oSprite.height + 20;
            iNumRows++;
        }

        if(NUM_ROWS_PAGE_LEVEL > iNumRows){
            NUM_ROWS_PAGE_LEVEL = iNumRows;
        }
        
        
        var iNumCols = 0;
        var iX = 0;
        var iWidthBounds = CANVAS_WIDTH - (EDGEBOARD_X*2);
        var oSprite = s_oSpriteLibrary.getSprite('level_sprite'); 

        while(iX < iWidthBounds){
            iX += (oSprite.width/2) + 5;
            iNumCols++;  
        }
        if(NUM_COLS_PAGE_LEVEL > iNumCols){
            NUM_COLS_PAGE_LEVEL = iNumCols;
        }
    };
    
    this._createNewLevelPage = function(iStartLevel,iEndLevel){
        var oContainerLevelBut = new createjs.Container();
        _oContainer.addChild(oContainerLevelBut);
        _aContainerPage.push(oContainerLevelBut);
        
        
        var iCont = 0;
        var iY = 0;
        var iNumRow = 1;
        var bNewPage = false;
        var oSprite = s_oSpriteLibrary.getSprite('level_sprite');
        
        var iLevelIndex;
        for(var i=iStartLevel;i<iEndLevel;i++){
            iLevelIndex = oData[i].index+1;
            var oBut = new CLevelBut(_aPointsX[iCont] + oSprite.width/4, iY + oSprite.height/2,oSprite, iLevelIndex>s_iLastLevel?false:true/*true*/, iLevelIndex, oContainerLevelBut);
            if( i === 0){
                oBut.addEventListenerWithParams(ON_MOUSE_UP, this._onClickHelp, this, i);
            }else{
                oBut.addEventListenerWithParams(ON_MOUSE_UP, this._onClick, this, i);
            }

            _aLevelButs.push(oBut);
            
            iCont++;
            if(iCont === _aPointsX.length){
                iCont = 0;
                iY += oSprite.height + 20;
                iNumRow++;

                if(iNumRow > NUM_ROWS_PAGE_LEVEL){
                    bNewPage = true;
                    break;
                }
            }
        }
        
        if(oContainerLevelBut.getBounds() !== null){
            oContainerLevelBut.x = CANVAS_WIDTH/2 ;
            oContainerLevelBut.y = 400;
            oContainerLevelBut.regX = oContainerLevelBut.getBounds().width/2;
        }
        
        
        if(bNewPage && _aLevelButs.length < oData.length){
            //ADD A PAGE
            this._createNewLevelPage(i+1,iEndLevel);
        }
        
    };

    this._onRight = function(){
        _aContainerPage[_iCurPage].visible = false;
        
        _iCurPage++;
        if(_iCurPage >=  _aContainerPage.length){
            _iCurPage = 0;
        }
        
        _aContainerPage[_iCurPage].visible = true;
    };
    
    this._onLeft = function(){
        _aContainerPage[_iCurPage].visible = false;
        
        _iCurPage--;
        if(_iCurPage <  0){
            _iCurPage =_aContainerPage.length-1;
        }
        
        _aContainerPage[_iCurPage].visible = true;
    };

    this._onNumModeToggle = function(iData){
        if(iData === NUM_ACTIVE){
            _bNumActive = true;
            _oModeNumOff.setActive(false);
            _oModeNumOn.setActive(true);
            
        }else {
            _bNumActive = false;
            _oModeNumOff.setActive(true);
            _oModeNumOn.setActive(false);
        }
    };

    this._onClick = function(i){
        var level = oData[i].index;
        var clickable = _aLevelButs[i].ifClickable();
        if(clickable){
            s_oLevelMenu.unload();
            s_oModeMenu.unload();
            s_oMain.gotoGame(level, 0);
        }
    };
    
    this._onClickHelp = function(i){
        var level = oData[i].index;
        var clickable = _aLevelButs[i].ifClickable();
        if(clickable){
            s_oLevelMenu.unload();
            s_oModeMenu.unload();
            s_oMain.gotoHelp(level);
        }
    };

    this._onExit = function(){
        s_oLevelMenu.unload();
    };

    s_oLevelMenu = this;        
    this._init();

};

var s_oLevelMenu = null;