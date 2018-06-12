function CCell(iXPos, iYPos, oSprite, iType, iID, iRow, iCol) {

    var _oCell;
    var _szTag;
    var _bOccupied;
    var _iType;
    var _iID;
    var _oPos;
    var _iCollision;
    var _iRow;
    var _iCol;
    var _iBlinkExplosion;
    var _bOut = null;
    var _fTimeTrap = null;
    var _bOnlyCollision=false;

    this._init = function (iXPos, iYPos, oSprite, iType, iID, iRow, iCol) {
        _iType = iType;
        _iID = iID;
        _oPos = {x: iXPos, y: iYPos};

        _iRow = iRow;
        _iCol = iCol;

        _iBlinkExplosion = BLINK_BEFORE_EXPLOSION;

        if (iType !== -1 && iType !== 10) {
            var iOffsetX = OFFSET_REG_OBJECT[iType].x;
            var iOffsetY = OFFSET_REG_OBJECT[iType].y;
            if (iType === 0 || iType === 1 || iType === 4 || iType === 7 || iType === 8 || iType === 9) {
                _oCell = createBitmap(oSprite);
                _oCell.regX = (oSprite.width * 0.5) + iOffsetX;
                _oCell.regY = (oSprite.height * 0.5) + iOffsetY;
            } else if (iType === 2 || iType === 3 || iType === 5 || iType === 6) {
                var oData = {
                    images: [oSprite],
                    // width, height & registration point of each sprite
                    frames: {width: (oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
                    animations: OBJECT_SPRITESHEET_NUM[iType].animations
                };
                var oSpriteSheetHeroBottom = new createjs.SpriteSheet(oData);
                _oCell = createSprite(oSpriteSheetHeroBottom, "normal", ((oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width, oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height);
                if (iType === 6) {
                    _fTimeTrap = TIME_TRAP;
                    _bOut = false;
                }
            }

            if (iType !== 6)
                _bOccupied = true;
            else
                _bOccupied = false;

            _oCell.x = iXPos;
            _oCell.y = iYPos;

            s_oScrollStage.addChild(_oCell);
        } else {
            if (iType === -1) {
                _bOccupied = false;
                _szTag = "nothing";
                _iCollision = CELL_SIZE;
            } else if (iType === 10) {
                _bOccupied = true;
                _szTag = "object";
                _bOnlyCollision=true;
                _iCollision = CELL_SIZE;
            }
        }

        if (SHOW_CELL === true) {
            var oCellGraphic;
            var oSpriteCell = s_oSpriteLibrary.getSprite("cell");
            oCellGraphic = createBitmap(oSpriteCell);
            oCellGraphic.x = iXPos;
            oCellGraphic.y = iYPos;
            oCellGraphic.regX = oSpriteCell.width * 0.5;
            oCellGraphic.regY = oSpriteCell.height * 0.5;
            s_oScrollStage.addChild(oCellGraphic);
        }
    };

    this.getX = function () {
        return _oPos.x;
    };

    this.getY = function () {
        return _oPos.y;
    };

    this.setObjectPosition = function (iXPos, iYPos) {
        if (_oCell) {
            _oCell.x = iXPos;
            _oCell.y = iYPos;
        }
    };

    this.activeExplosive = function () {
        _oCell.gotoAndPlay("blink");
        playSound("barrel_active", 1, false);
        _oCell.on("animationend", function () {
            _iBlinkExplosion--;
            if (_iBlinkExplosion === 0) {
                s_oGame.borrowExplosion(_oCell.x, _oCell.y);
                _oCell.removeAllEventListeners();
                _oCell.gotoAndPlay("explosion");
                _oCell.on("animationend", function () {
                    _oCell.removeAllEventListeners();
                    s_oGame.unloadObject(_iCol, _iRow);
                });
            }
        });
    };
    
    this.onlyCollision = function () {
        return _bOnlyCollision;
    };

    this.getTag = function () {
        return _szTag;
    };

    this.setTag = function (szValue) {
        _szTag = szValue;
    };

    this.getRow = function () {
        return _iRow;
    };

    this.getCol = function () {
        return _iCol;
    };

    this.getOccupied = function () {
        return _bOccupied;
    };

    this.setOccupied = function (bValue) {
        _bOccupied = bValue;
    };

    this.getType = function () {
        return _iType;
    };

    this.setType = function (iValue) {
        _iType = iValue;
    };

    this.getID = function () {
        return iID;
    };

    this.getCollision = function () {
        return _iCollision;
    };

    this.setCollision = function (iValue) {
        _iCollision = iValue;
    };

    this.getObjectID = function () {
        return s_oScrollStage.getChildIndex(_oCell);
    };

    this.setPosition = function (iXPos, iYPos) {
        _oCell.x = iXPos;
        _oCell.y = iYPos;
    };

    this.setTrapState = function (szState) {
        _oCell.gotoAndPlay(szState);
        _fTimeTrap = TIME_TRAP;
        _oCell.on("animationend", function () {
            if (szState === "out") {
                _oCell.gotoAndStop("released");
                _bOut = true;
            } else if (szState === "in") {
                _oCell.gotoAndStop("normal");
                _bOut = false;

            }
            _oCell.removeAllEventListeners();
        });
    };

    this.getTrapOut = function () {
        return _bOut;
    };

    this.setChildIndex = function (iValue) {
        s_oScrollStage.setChildIndex(_oCell, iValue);
    };
    this.unload = function () {
        if (_oCell)
            s_oScrollStage.removeChild(_oCell);
        s_oCell = null;
    };

    this.update = function () {
        if (_fTimeTrap > 0) {
            _fTimeTrap -= 1 / createjs.Ticker.framerate;
        } else {
            if (_bOut === false) {
                this.setTrapState("out");
                playSound("trap_floor_out", 1, false);
            } else if (_bOut === true) {
                this.setTrapState("in");
                playSound("trap_floor_in", 1, false);
            }
        }
    };

    s_oCell = this;

    this._init(iXPos, iYPos, oSprite, iType, iID, iRow, iCol);
}

var s_oCell;

