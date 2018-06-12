function CCharacter(iXPos, iYPos, iRow, iCol) {

    var _oHeroBottom;
    var _oHeroLeft;
    var _oHeroRight;
    var _oHeroTop;
    var _iSpeed;
    var _iCell;
    var _iCollision;
    var _iSelectedHero;
    var _iIndexStage;
    var _iRow;
    var _iCol;

    this._init = function (iXPos, iYPos, iRow, iCol) {

        var oSpriteHeroBottom = s_oSpriteLibrary.getSprite("hero_bottom");
        var oData = {
            images: [oSpriteHeroBottom],
            // width, height & registration point of each sprite
            frames: {width: (oSpriteHeroBottom.width / 13), height: oSpriteHeroBottom.height / 6, regX: (oSpriteHeroBottom.width / 2) / 13 + CHARACTER_OFFSET_REG.x, regY: (oSpriteHeroBottom.height / 2) / 6 + CHARACTER_OFFSET_REG.y},
            animations: {idle: [0, 23, "idle", 1], walk: [24, 39, "walk", 1], attack: [40, 55, "attack", 1], die: [56, 77, "die", 1]}
        };
        var oSpriteSheetHeroBottom = new createjs.SpriteSheet(oData);

        _iRow = iRow;
        _iCol = iCol;

        _oHeroBottom = createSprite(oSpriteSheetHeroBottom, "idle", ((oSpriteHeroBottom.width / 2) / 13) + CHARACTER_OFFSET_REG.x, ((oSpriteHeroBottom.height / 2) / 6) + CHARACTER_OFFSET_REG.y, oSpriteHeroBottom.width / 13, oSpriteHeroBottom.height / 6);
        _iSelectedHero = 0;

        this.createHeroLeft();
        this.createHeroRight();
        this.createHeroTop();

        _oHeroBottom.x = iXPos;
        _oHeroBottom.y = iYPos;
        _iSpeed = CHARACTER_SPEED;
        s_oScrollStage.addChild(_oHeroBottom);
    };
    this.getX = function () {
        switch (_iSelectedHero) {
            case 0:
                return _oHeroBottom.x;
                break;
            case 1:
                return _oHeroLeft.x;
                break;
            case 2 :
                return _oHeroRight.x;
                break;
            case 3:
                return _oHeroTop.x;
                break;
        }
    };
    this.getY = function () {
        switch (_iSelectedHero) {
            case 0:
                return _oHeroBottom.y;
                break;
            case 1:
                return _oHeroLeft.y;
                break;
            case 2 :
                return _oHeroRight.y;
                break;
            case 3:
                return _oHeroTop.y;
                break;
        }
    };
    this.setPosition = function (iXPos, iYPos) {
        switch (_iSelectedHero) {
            case 0:
                _oHeroBottom.x = iXPos;
                _oHeroBottom.y = iYPos;
                break;
            case 1:
                _oHeroLeft.x = iXPos;
                _oHeroLeft.y = iYPos;
                break;
            case 2:
                _oHeroRight.x = iXPos;
                _oHeroRight.y = iYPos;
                break;
            case 3 :
                _oHeroTop.x = iXPos;
                _oHeroTop.y = iYPos;
                break;
        }
    };
    this.setCell = function (iValue) {
        _iCell = iValue;
    };
    this.getCell = function () {
        return _iCell;
    };

    this.getRow = function () {
        return _iRow;
    };

    this.getCol = function () {
        return _iCol;
    };

    this.setRow = function (iValue) {
        _iRow = iValue;
    };

    this.setCol = function (iValue) {
        _iCol = iValue;
    };

    this.setCollision = function (iValue) {
        _iCollision = iValue;
    };
    this.getCollision = function () {
        return _iCollision;
    };
    this.playState = function (szState) {
        switch (_iSelectedHero) {
            case 0:
                _oHeroBottom.gotoAndPlay(szState);
                if (szState === "die") {
                    _oHeroBottom.on("animationend", this.stopStateDie);
                }
                break;
            case 1:
                _oHeroLeft.gotoAndPlay(szState);
                if (szState === "die") {
                    _oHeroLeft.on("animationend", this.stopStateDie);
                }
                break;
            case 2:
                _oHeroRight.gotoAndPlay(szState);
                if (szState === "die") {
                    _oHeroRight.on("animationend", this.stopStateDie);
                }
                break;
            case 3:
                _oHeroTop.gotoAndPlay(szState);
                if (szState === "die") {
                    _oHeroTop.on("animationend", this.stopStateDie);
                }
                break;
        }
    };
    this.stopStateDie = function () {
        switch (_iSelectedHero) {
            case 0:
                _oHeroBottom.gotoAndStop(77);
                _oHeroBottom.removeAllEventListeners();
                break;
            case 1:
                _oHeroLeft.gotoAndStop(77);
                _oHeroLeft.removeAllEventListeners();
                break;
            case 2:
                _oHeroRight.gotoAndStop(77);
                _oHeroRight.removeAllEventListeners();
                break;
            case 3:
                _oHeroTop.gotoAndStop(77);
                _oHeroTop.removeAllEventListeners();
                break;
        }
    };
    this.setChildIndex = function (iValue) {
        _iIndexStage = iValue;
        switch (_iSelectedHero) {
            case 0:
                s_oScrollStage.setChildIndex(_oHeroBottom, _iIndexStage);
                break;
            case 1:
                s_oScrollStage.setChildIndex(_oHeroLeft, _iIndexStage);
                break;
            case 2:
                s_oScrollStage.setChildIndex(_oHeroRight, _iIndexStage);
                break;
            case 3:
                s_oScrollStage.setChildIndex(_oHeroTop, _iIndexStage);
                break;
        }
        s_oScrollStage.setChildIndex(_oHeroBottom, iValue);
    };

    this.unload = function () {
        s_oScrollStage.removeChild(_oHeroBottom);
        s_oScrollStage.removeChild(_oHeroLeft);
        s_oScrollStage.removeChild(_oHeroRight);
        s_oScrollStage.removeChild(_oHeroTop);
        s_oCharacter = null;
    };
    this.setSpeed = function (iValue) {
        _iSpeed = iValue;
    };
    this.switchHero = function (iValue) {
        switch (iValue) {
            case 0 :
                if (_iSelectedHero !== 0) {
                    if (_iSelectedHero === 1) {
                        _oHeroBottom.x = _oHeroLeft.x;
                        _oHeroBottom.y = _oHeroLeft.y;
                        s_oScrollStage.removeChild(_oHeroLeft);
                    } else if (_iSelectedHero === 2) {
                        _oHeroBottom.x = _oHeroRight.x;
                        _oHeroBottom.y = _oHeroRight.y;
                        s_oScrollStage.removeChild(_oHeroRight);
                    } else if (_iSelectedHero === 3) {
                        _oHeroBottom.x = _oHeroTop.x;
                        _oHeroBottom.y = _oHeroTop.y;
                        s_oScrollStage.removeChild(_oHeroTop);
                    }
                    s_oScrollStage.addChild(_oHeroBottom);
                    s_oScrollStage.setChildIndex(_oHeroBottom, _iIndexStage);
                    _iSelectedHero = iValue;
                }
                break;
            case 1 :
                if (_iSelectedHero !== 1) {
                    if (_iSelectedHero === 0) {
                        _oHeroLeft.x = _oHeroBottom.x;
                        _oHeroLeft.y = _oHeroBottom.y;
                        s_oScrollStage.removeChild(_oHeroBottom);
                    } else if (_iSelectedHero === 2) {
                        _oHeroLeft.x = _oHeroRight.x;
                        _oHeroLeft.y = _oHeroRight.y;
                        s_oScrollStage.removeChild(_oHeroRight);
                    } else if (_iSelectedHero === 3) {
                        _oHeroLeft.x = _oHeroTop.x;
                        _oHeroLeft.y = _oHeroTop.y;
                        s_oScrollStage.removeChild(_oHeroTop);
                    }
                    s_oScrollStage.addChild(_oHeroLeft);
                    s_oScrollStage.setChildIndex(_oHeroLeft, _iIndexStage);
                    _iSelectedHero = iValue;
                }
                break;
            case 2:
                if (_iSelectedHero !== 2) {
                    if (_iSelectedHero === 0) {
                        _oHeroRight.x = _oHeroBottom.x;
                        _oHeroRight.y = _oHeroBottom.y;
                        s_oScrollStage.removeChild(_oHeroBottom);
                    } else if (_iSelectedHero === 1) {
                        _oHeroRight.x = _oHeroLeft.x;
                        _oHeroRight.y = _oHeroLeft.y;
                        s_oScrollStage.removeChild(_oHeroLeft);
                    } else if (_iSelectedHero === 3) {
                        _oHeroRight.x = _oHeroTop.x;
                        _oHeroRight.y = _oHeroTop.y;
                        s_oScrollStage.removeChild(_oHeroTop);
                    }
                    s_oScrollStage.addChild(_oHeroRight);
                    s_oScrollStage.setChildIndex(_oHeroRight, _iIndexStage);
                    _iSelectedHero = iValue;
                }
                break;
            case 3:
                if (_iSelectedHero !== 3) {
                    if (_iSelectedHero === 0) {
                        _oHeroTop.x = _oHeroBottom.x;
                        _oHeroTop.y = _oHeroBottom.y;
                        s_oScrollStage.removeChild(_oHeroBottom);
                    } else if (_iSelectedHero === 1) {
                        _oHeroTop.x = _oHeroLeft.x;
                        _oHeroTop.y = _oHeroLeft.y;
                        s_oScrollStage.removeChild(_oHeroLeft);
                    } else if (_iSelectedHero === 2) {
                        _oHeroTop.x = _oHeroRight.x;
                        _oHeroTop.y = _oHeroRight.y;
                        s_oScrollStage.removeChild(_oHeroRight);
                    }
                    s_oScrollStage.addChild(_oHeroTop);
                    s_oScrollStage.setChildIndex(_oHeroTop, _iIndexStage);
                    _iSelectedHero = iValue;
                }
                break;
        }
    };

    this.createHeroLeft = function () {
        var oSpriteHeroLeft = s_oSpriteLibrary.getSprite("hero_left");
        var oData = {
            images: [oSpriteHeroLeft],
            // width, height & registration point of each sprite
            frames: {width: oSpriteHeroLeft.width / 10, height: oSpriteHeroLeft.height / 8, regX: (oSpriteHeroLeft.width / 2) / 10 + CHARACTER_OFFSET_REG.x, regY: (oSpriteHeroLeft.height / 2) / 8 + CHARACTER_OFFSET_REG.y},
            animations: {idle: [0, 23, "idle", 1], walk: [24, 39, "walk", 1], attack: [40, 55, "attack", 1], die: [56, 77, "die", 1]}
        };
        var oSpriteSheetHeroLeft = new createjs.SpriteSheet(oData);
        _oHeroLeft = createSprite(oSpriteSheetHeroLeft, "idle", ((oSpriteHeroLeft.width / 2) / 10) + CHARACTER_OFFSET_REG.x, ((oSpriteHeroLeft.height / 2) / 8) + CHARACTER_OFFSET_REG.y, oSpriteHeroLeft.width / 10, oSpriteHeroLeft.height / 8);
    };

    this.createHeroRight = function () {
        var oSpriteHeroRight = s_oSpriteLibrary.getSprite("hero_right");
        var oData = {
            images: [oSpriteHeroRight],
            // width, height & registration point of each sprite
            frames: {width: oSpriteHeroRight.width / 10, height: oSpriteHeroRight.height / 8, regX: (oSpriteHeroRight.width / 2) / 10 + CHARACTER_OFFSET_REG.x, regY: (oSpriteHeroRight.height / 2) / 8 + CHARACTER_OFFSET_REG.y},
            animations: {idle: [0, 23, "idle", 1], walk: [24, 39, "walk", 1], attack: [40, 55, "attack", 1], die: [56, 77, "die", 1]}
        };
        var oSpriteSheetHeroRight = new createjs.SpriteSheet(oData);
        _oHeroRight = createSprite(oSpriteSheetHeroRight, "idle", ((oSpriteHeroRight.width / 2) / 10) + CHARACTER_OFFSET_REG.x, ((oSpriteHeroRight.height / 2) / 8) + CHARACTER_OFFSET_REG.y, oSpriteHeroRight.width / 10, oSpriteHeroRight.height / 8);
    };

    this.createHeroTop = function () {
        var oSpriteHeroTop = s_oSpriteLibrary.getSprite("hero_top");
        var oData = {
            images: [oSpriteHeroTop],
            // width, height & registration point of each sprite
            frames: {width: oSpriteHeroTop.width / 10, height: oSpriteHeroTop.height / 8, regX: (oSpriteHeroTop.width / 2) / 10 + CHARACTER_OFFSET_REG.x, regY: (oSpriteHeroTop.height / 2) / 8 + CHARACTER_OFFSET_REG.y},
            animations: {idle: [0, 23, "idle", 1], walk: [24, 39, "walk", 1], attack: [40, 55, "attack", 1], die: [56, 77, "die", 1]}
        };
        var oSpriteSheetHeroTop = new createjs.SpriteSheet(oData);
        _oHeroTop = createSprite(oSpriteSheetHeroTop, "idle", ((oSpriteHeroTop.width / 2) / 10) + CHARACTER_OFFSET_REG.x, ((oSpriteHeroTop.height / 2) / 8) + CHARACTER_OFFSET_REG.y, oSpriteHeroTop.width / 10, oSpriteHeroTop.height / 8);
    };
    
    this.update = function (iDir, szAction) {
        switch (_iSelectedHero) {
            case 0:
                if (szAction === "right" || szAction === "left")
                    _oHeroBottom.x += _iSpeed * iDir;
                else
                    _oHeroBottom.y += _iSpeed * iDir;
                break;
            case 1:
                if (szAction === "right" || szAction === "left")
                    _oHeroLeft.x += _iSpeed * iDir;
                else
                    _oHeroLeft.y += _iSpeed * iDir;
                break;
            case 2:
                if (szAction === "right" || szAction === "left")
                    _oHeroRight.x += _iSpeed * iDir;
                else
                    _oHeroRight.y += _iSpeed * iDir;
                break;
            case 3:
                if (szAction === "right" || szAction === "left")
                    _oHeroTop.x += _iSpeed * iDir;
                else
                    _oHeroTop.y += _iSpeed * iDir;
                break;
        }
    };
    s_oCharacter = this;
    this._init(iXPos, iYPos, iRow, iCol);
}

var s_oCharacter;

