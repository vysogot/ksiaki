function CEnemy(iXPos, iYPos, iType, iRow, iCol, iIndex) {

    var _oEnemyBottom;
    var _oEnemyTop;
    var _oEnemyLeftRight;
    var _iSpeed;
    var _aPath = null;
    var _bStop;
    var _fTime;
    var _iID;
    var _iCell;
    var _iCollision;
    var _oMatrix;
    var _bFound;
    var _bCanFollow = false;
    var _bExistingPath = false;
    var _bFollow = false;
    var _bTargetMoved = true;
    var _oTarget;
    var _iType;
    var _bPlayerKilled = false;
    var _bBottom = true;
    var _bTop = false;
    var _bLeftRight = false;
    var _bDead = false;
    var _szAnimation;
    var _iIndexStage;
    var _bEscape;
    var _bIgnorePlayer;
    var _fTimeIgnore;
//--------------------------------------------
    var _bMoving = false;
    var _iPathIncrement = 1;
    var _iCurPathIndex = 0;
    var _iNextPathIndex = 0;
    var _iWalkDuration = ENEMY_SPEED[iType];
    var _iWalkTime = 0;
    var _bFinishPath = false;
    var _vDir = {x: 0, y: 0};
//---------------------------------------------

    this._init = function (iXPos, iYPos, iType, iRow, iCol, iIndex) {
        _iType = iType;
        _iIndexStage = iIndex;
        var oSpriteEnemyBottom = s_oSpriteLibrary.getSprite("enemy_bottom_" + iType);
        var oData = {
            images: [oSpriteEnemyBottom],
            // width, height & registration point of each sprite
            frames: {width: oSpriteEnemyBottom.width / 9, height: oSpriteEnemyBottom.height / 6, regX: (oSpriteEnemyBottom.width / 2) / 9 + ENEMY_OFFSET_REG[_iType].x, regY: (oSpriteEnemyBottom.height / 2) / 6 + ENEMY_OFFSET_REG[_iType].y},
            animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
        };
        var oSpriteSheetHeroBottom = new createjs.SpriteSheet(oData);

        _oEnemyBottom = createSprite(oSpriteSheetHeroBottom, 0, ((oSpriteEnemyBottom.width / 2) / 9) + ENEMY_OFFSET_REG[_iType].x, ((oSpriteEnemyBottom.height / 2) / 6) + ENEMY_OFFSET_REG[_iType].y, oSpriteEnemyBottom.width / 9, oSpriteEnemyBottom.height / 6);
        _oEnemyBottom.stop();
        this.createEnemyTop();
        this.createEnemyLeftRight();

        _oEnemyBottom.x = iXPos;
        _oEnemyBottom.y = iYPos;

        _oMatrix = {r: iRow, c: iCol};

        _iSpeed = ENEMY_SPEED[iType];

        _bStop = false;

        _fTimeIgnore = 0;

        _bFound = false;

        _bIgnorePlayer = false;

        s_oScrollStage.addChild(_oEnemyBottom);

        s_oScrollStage.setChildIndex(_oEnemyBottom, _iIndexStage);

        _szAnimation = "walk";
    };

    this.getX = function () {
        if (_bBottom === true) {
            return _oEnemyBottom.x;
        } else if (_bTop === true) {
            return _oEnemyTop.x;
        } else if (_bLeftRight) {
            return _oEnemyLeftRight.x;
        }
    };

    this.getY = function () {
        if (_bBottom === true) {
            return _oEnemyBottom.y;
        } else if (_bTop === true) {
            return _oEnemyTop.y;
        } else if (_bLeftRight) {
            return _oEnemyLeftRight.y;
        }
    };

    this.setPosition = function (iXPos, iYPos) {
        if (_bBottom === true) {
            _oEnemyBottom.x = iXPos;
            _oEnemyBottom.y = iYPos;
        } else if (_bTop === true) {
            _oEnemyTop.x = iXPos;
            _oEnemyTop.y = iYPos;
        } else if (_bLeftRight === true) {
            _oEnemyLeftRight.x = iXPos;
            _oEnemyLeftRight.y = iYPos;
        }
    };

    this.setID = function (iValue) {
        _iID = iValue;
    };

    this.getID = function () {
        return _iID;
    };

    this.setCell = function (iValue) {
        _iCell = iValue;
    };

    this.setChildIndex = function (iValue) {
        _iIndexStage = iValue;
        if (_bBottom) {
            s_oScrollStage.setChildIndex(_oEnemyBottom, _iIndexStage);
        } else if (_bTop) {
            s_oScrollStage.setChildIndex(_oEnemyTop, _iIndexStage);
        } else if (_bLeftRight) {
            s_oScrollStage.setChildIndex(_oEnemyLeftRight, _iIndexStage);
        }
    };

    this.getCell = function () {
        return _iCell;
    };

    this.createEnemyTop = function () {
        var oSpriteEnemyTop = s_oSpriteLibrary.getSprite("enemy_top_" + iType);
        var oData = {
            images: [oSpriteEnemyTop],
            // width, height & registration point of each sprite
            frames: {width: oSpriteEnemyTop.width / 9, height: oSpriteEnemyTop.height / 6, regX: (oSpriteEnemyTop.width / 2) / 9 + ENEMY_OFFSET_REG[_iType].x, regY: (oSpriteEnemyTop.height / 2) / 6 + ENEMY_OFFSET_REG[_iType].y},
            animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
        };
        var oSpriteSheetHeroTop = new createjs.SpriteSheet(oData);

        _oEnemyTop = createSprite(oSpriteSheetHeroTop, 0, ((oSpriteEnemyTop.width / 2) / 9) + ENEMY_OFFSET_REG[_iType].x, ((oSpriteEnemyTop.height / 2) / 6) + ENEMY_OFFSET_REG[_iType].y, oSpriteEnemyTop.width / 9, oSpriteEnemyTop.height / 6);
    };

    this.createEnemyLeftRight = function () {
        var oSpriteEnemyLeftRight = s_oSpriteLibrary.getSprite("enemy_left_right_" + iType);
        var oData = {
            images: [oSpriteEnemyLeftRight],
            // width, height & registration point of each sprite
            frames: {width: oSpriteEnemyLeftRight.width / 9, height: oSpriteEnemyLeftRight.height / 6, regX: (oSpriteEnemyLeftRight.width / 2) / 9 + ENEMY_OFFSET_REG[_iType].x, regY: (oSpriteEnemyLeftRight.height / 2) / 6 + ENEMY_OFFSET_REG[_iType].y},
            animations: {walk: [0, 15, "walk", 1], escape: [16, 31, "attack", 1], die: [32, 53, "die", 1]}
        };
        var oSpriteSheetHeroLeftRight = new createjs.SpriteSheet(oData);

        _oEnemyLeftRight = createSprite(oSpriteSheetHeroLeftRight, 0, ((oSpriteEnemyLeftRight.width / 2) / 9) + ENEMY_OFFSET_REG[_iType].x, ((oSpriteEnemyLeftRight.height / 2) / 6) + ENEMY_OFFSET_REG[_iType].y, oSpriteEnemyLeftRight.width / 9, oSpriteEnemyLeftRight.height / 6);

    };

    this.setCollision = function (iValue) {
        _iCollision = iValue;
    };

    this.setFound = function (bVal) {
        _bFound = bVal;
    };

    this.getFound = function () {
        return _bFound;
    };

    this.getCollision = function () {
        return _iCollision;
    };

    this.getMatrix = function () {
        return _oMatrix;
    };

    this.pauseAnimation = function () {
        if (_bBottom) {
            _oEnemyBottom.stop();
        } else if (_bTop) {
            _oEnemyTop.stop();
        } else if (_bLeftRight) {
            _oEnemyLeftRight.stop();
        }
    };

    this.resumeAnimation = function () {
        if (_bBottom) {
            _oEnemyBottom.play();
        } else if (_bTop) {
            _oEnemyTop.play();
        } else if (_bLeftRight) {
            _oEnemyLeftRight.play();
        }
    };

    this.setMatrix = function (iRow, iCol) {
        _oMatrix = {r: iRow, c: iCol};
    };

    this.getType = function () {
        return _iType;
    };

    this.unload = function () {

        s_oScrollStage.removeChild(_oEnemyBottom);
        s_oScrollStage.removeChild(_oEnemyTop);
        s_oScrollStage.removeChild(_oEnemyLeftRight);

        _aPath = null;
        s_oEnemy = null;
    };

    this.setSpeed = function (iValue) {
        _iSpeed = iValue;
    };

    this.getCurrentCell = function () {
        if (_aPath === null) {
            return;
        }
        return _aPath[_iCurPathIndex];
    };

    this.setTrajectory = function (aPath, fTime) {
        this.newPath();
        _aPath = new Array();
        for (var i = 0; i < aPath.length; i++) {
            _aPath.push(
                    {
                        r: aPath[i].x,
                        c: aPath[i].y,
                        y: aPath[i].y * CELL_SIZE + CELL_HALF_SIZE,
                        x: aPath[i].x * CELL_SIZE + CELL_HALF_SIZE
                    });
        }
        _fTime = fTime;
    };

    this.setPlayerKilled = function (bVal) {
        _bPlayerKilled = bVal;
    };

    this.newPath = function () {
        _iPathIncrement = 1;
        _iCurPathIndex = 0;
        _iNextPathIndex = 0;
        _iWalkDuration = ENEMY_SPEED[iType];
        _iWalkTime = 0;
        _vDir = {x: 0, y: 0};
        _bFinishPath = false;
        _bMoving = false;
    };

    this.pathFinished = function () {
        return _bFinishPath;
    };

    this.__moveEnemy = function () {

        if (_bFinishPath === true) {
            _bMoving = false;
            return;
        }
        // LINEAR MOVEMENT
        var iTotTime = _iWalkTime + s_iTimeElaps;
        if (iTotTime >= _iWalkDuration) {
            iTotTime = _iWalkDuration;
            // END OF DESTINATION
            _bMoving = false;
            _iWalkTime = iTotTime - _iWalkDuration;
        } else {
            _iWalkTime = iTotTime;
        }
        var iMovement = easeLinear(iTotTime, 0, CELL_SIZE, _iWalkDuration);

        var oPos = {x: 0, y: 0};

        oPos.x = _aPath[_iCurPathIndex].x + _vDir.x * iMovement;
        oPos.y = _aPath[_iCurPathIndex].y + _vDir.y * iMovement;

        if (_bBottom === true) {
            _oEnemyBottom.x = oPos.x;
            _oEnemyBottom.y = oPos.y;
        } else if (_bTop === true) {
            _oEnemyTop.x = oPos.x;
            _oEnemyTop.y = oPos.y;
        } else if (_bLeftRight === true) {
            _oEnemyLeftRight.x = oPos.x;
            _oEnemyLeftRight.y = oPos.y;
        }

        if (_bMoving === false) {
            _iCurPathIndex = _iNextPathIndex;
        }
    };

    this.getTargetCoordinate = function () {
        return _oTarget;
    };

    this.setTargetCoordinate = function (oTarget) {
        _oTarget = {r: oTarget.r, c: oTarget.c};
    };

    this.__followNextCellPath = function () {
        if (_iCurPathIndex + _iPathIncrement === _aPath.length) {
            _bFinishPath = true;
            return;
        }

        _iNextPathIndex = _iCurPathIndex + _iPathIncrement;
        _iWalkTime = 0;
        if (_aPath[_iCurPathIndex].x < _aPath[_iNextPathIndex].x) {
            _vDir.x = 1;
        } else if (_aPath[_iCurPathIndex].x > _aPath[_iNextPathIndex].x) {
            _vDir.x = -1;
        } else {
            _vDir.x = 0;
        }

        if (_aPath[_iCurPathIndex].y < _aPath[_iNextPathIndex].y) {
            _vDir.y = 1;
        } else if (_aPath[_iCurPathIndex].y > _aPath[_iNextPathIndex].y) {
            _vDir.y = -1;
        } else {
            _vDir.y = 0;
        }

        this.changeAnimDirection();
    };

    this.changeAnimDirection = function () {
        var oPos;
        if (_bBottom === false && _vDir.y === 1) {
            if (_bTop === true) {
                oPos = {x: _oEnemyTop.x, y: _oEnemyTop.y};
                s_oScrollStage.removeChild(_oEnemyTop);
                _bTop = false;
            } else if (_bLeftRight === true) {
                oPos = {x: _oEnemyLeftRight.x, y: _oEnemyLeftRight.y};
                s_oScrollStage.removeChild(_oEnemyLeftRight);
                _bLeftRight = false;
            }
            _bBottom = true;
            _oEnemyBottom.x = oPos.x;
            _oEnemyBottom.y = oPos.y;
            s_oScrollStage.addChild(_oEnemyBottom);
            s_oScrollStage.setChildIndex(_oEnemyBottom, _iIndexStage);
            _oEnemyBottom.gotoAndPlay(_szAnimation);
        } else if (_bTop === false && _vDir.y === -1) {
            if (_bBottom === true) {
                oPos = {x: _oEnemyBottom.x, y: _oEnemyBottom.y};
                s_oScrollStage.removeChild(_oEnemyBottom);
                _bBottom = false;
            } else if (_bLeftRight === true) {
                oPos = {x: _oEnemyLeftRight.x, y: _oEnemyLeftRight.y};
                s_oScrollStage.removeChild(_oEnemyLeftRight);
                _bLeftRight = false;
            }
            _bTop = true;
            _oEnemyTop.x = oPos.x;
            _oEnemyTop.y = oPos.y;
            s_oScrollStage.addChild(_oEnemyTop);
            s_oScrollStage.setChildIndex(_oEnemyTop, _iIndexStage);
            _oEnemyTop.gotoAndPlay(_szAnimation);
        } else if (_vDir.x === 1 || _vDir.x === -1) {
            if (_bLeftRight === false) {
                if (_bBottom === true) {
                    oPos = {x: _oEnemyBottom.x, y: _oEnemyBottom.y};
                    s_oScrollStage.removeChild(_oEnemyBottom);
                    _bBottom = false;
                } else if (_bTop === true) {
                    oPos = {x: _oEnemyTop.x, y: _oEnemyTop.y};
                    s_oScrollStage.removeChild(_oEnemyTop);
                    _bTop = false;
                }
                _bLeftRight = true;
                _oEnemyLeftRight.x = oPos.x;
                _oEnemyLeftRight.y = oPos.y;
                s_oScrollStage.addChild(_oEnemyLeftRight);
                s_oScrollStage.setChildIndex(_oEnemyLeftRight, _iIndexStage);
                _oEnemyLeftRight.gotoAndPlay(_szAnimation);
            }
            if (_vDir.x === 1) {
                _oEnemyLeftRight.scaleX = 1;
            } else {
                _oEnemyLeftRight.scaleX = -1;
            }
        }
    };

    this.changeState = function (szState) {
        if (_bBottom === true) {
            _oEnemyBottom.gotoAndPlay(szState);
            if (szState === "die")
                _oEnemyBottom.on("animationend", this.stopStateDie);
        } else if (_bTop === true) {
            _oEnemyTop.gotoAndPlay(szState);
            if (szState === "die")
                _oEnemyTop.on("animationend", this.stopStateDie);
        } else if (_bLeftRight === true) {
            _oEnemyLeftRight.gotoAndPlay(szState);
            if (szState === "die")
                _oEnemyLeftRight.on("animationend", this.stopStateDie);
        }

        _szAnimation = szState;
    };

    this.stopStateDie = function () {

        if (_bBottom === true) {
            _oEnemyBottom.gotoAndStop(53);
            _oEnemyBottom.removeAllEventListeners();
            createjs.Tween.get(_oEnemyBottom).to({alpha: 0}, 500).call(function () {
                s_oGame.unloadEnemy(_iID);
            });
        } else if (_bTop === true) {
            _oEnemyTop.gotoAndStop(53);
            _oEnemyTop.removeAllEventListeners();
            createjs.Tween.get(_oEnemyTop).to({alpha: 0}, 500).call(function () {
                s_oGame.unloadEnemy(_iID);
            });
        } else if (_bLeftRight === true) {
            _oEnemyLeftRight.gotoAndStop(53);
            _oEnemyLeftRight.removeAllEventListeners();
            createjs.Tween.get(_oEnemyLeftRight).to({alpha: 0}, 500).call(function () {
                s_oGame.unloadEnemy(_iID);
            });
        }
    };

    this.getChildIndex = function () {
        return _iIndexStage;
    };

    this.setTargetMove = function (bVal) {
        _bTargetMoved = bVal;
    };

    this.canFollow = function (bVal) {
        _bCanFollow = bVal;
    };

    this.getIgnorePlayer = function () {
        return _bIgnorePlayer;
    };

    this.ignorePlayer = function (bVal) {
        _bIgnorePlayer = bVal;
        if (bVal === true)
            _fTimeIgnore = 3;
    };

    this.existingPath = function (bVal) {
        _bExistingPath = bVal;
    };

    this.followMode = function (bVal) {
        _bFollow = bVal;
    };

    this.getFollowMode = function () {
        return _bFollow;
    };

    this.getEscape = function () {
        return  _bEscape;
    };

    this.setEscape = function (bVal) {
        _bEscape = bVal;
    };

    this.targetMoved = function (bVal) {
        _bTargetMoved = bVal;
    };

    this.playerKilled = function () {
        if (_bPlayerKilled === true) {
        }
    };

    this.dead = function () {
        _bDead = true;
        this.changeState("die");
    };

    this.getDead = function () {
        return _bDead;
    };

    this.update = function () {

        if (_fTimeIgnore > 0) {
            _fTimeIgnore -= 1 / createjs.Ticker.framerate;
        } else {
            _bIgnorePlayer = false;
        }

        if (_aPath === null) {
            return;
        }

        if (_bMoving === true) {
            this.__moveEnemy();
        } else {



            if (_bIgnorePlayer === false) {
                if (_bCanFollow === true && _bFollow === false) {
                    s_oGame.findTarget(_iID, false);
                }


                if (_bExistingPath === true && _bCanFollow === true) {
                    this.followMode(true);
                }

                if (_bFollow === true && _bTargetMoved === true) {
                    s_oGame.findTarget(_iID, true);
                }
            }

            this.__followNextCellPath();

            _bMoving = true;

            this.__moveEnemy();
        }

        if (_bFollow === true)
            this.playerKilled();
    };

    s_oEnemy = this;

    this._init(iXPos, iYPos, iType, iRow, iCol, iIndex);
}

var s_oEnemy;



