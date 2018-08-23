function CGame(oData, iLevel) {

    var _oBgLevel;
    var _oInterface;
    var _iLevel;
    var _bPause;
    var _oCharacter;
    var _iOffsetCharacterCol;
    var _iOffsetEnemyCol;
    var _iCanvasWidthHalf;
    var _iCanvasHeightHalf;
    var _aCell;
    var _aFloor;
    var _iObjDim;
    var _iRow;
    var _bPressedKeys;
    var _iDir;
    var _szAction;
    var _bCollision;
    var _iScore;
    var _iSpeedScroll;
    var _iOffsetLeft;
    var _iOffsetRight;
    var _iOffsetUp;
    var _iOffsetDown;
    var _aEnemy;
    var _bDead;
    var _iTimeRestart;
    var _iLife;
    var _iRowCharacter;
    var _iCellHalfDim;
    var _iCol;
    var _oEasyStar = new EasyStar.js();
    var _aWalkableCell;
    var _iTotCoins;
    var _iLevelAds;
    var _oStartPosCharacter;
    var _oStartCellCharacter;
    var _bCanInput;
    var _bCharacterAttack;
    var _fTimeBonusAttack;
    var _iComboAttack;
    var _iPreRow;
    var _aCanGo;
    var _szPrevAction;
    var _fTimeDir;
    var _fTimeCol;
    var _fTimeInput;
    var _bReachPoint;
    var _aTrap;
    var _iTrapsIndex;
    var _iKilledEnemy;
    var _iLevelScore;
    var _iToken;
    var _bSpaceBarNextLv;
    var _oHammer;

    //KSIAKI
    var _ServerScore;

    this._init = function () {

        setVolume("soundtrack", 0.4);
        this.setPause(true);
        s_oScrollStage = new createjs.Container();
        s_oStage.addChild(s_oScrollStage);

        _oBgLevel = createBitmap(s_oSpriteLibrary.getSprite("bg_level_1"));

        s_oScrollStage.addChild(_oBgLevel);

        _iCanvasWidthHalf = CANVAS_WIDTH / 2;
        _iCanvasHeightHalf = CANVAS_HEIGHT / 2;
        _iLevel = iLevel;
        s_oScrollStage.x = STAGE_POSITION_LEVEL[_iLevel].x;
        s_oScrollStage.y = STAGE_POSITION_LEVEL[_iLevel].y;
        _iScore = 0;
        _iLife = LIVES;
        _iSpeedScroll = CHARACTER_SPEED;

        _iLevelAds = 0;
        _iToken = 0;
        _iPreRow = 0;

        _bSpaceBarNextLv = false;

        _bCanInput = false;

        _iComboAttack = 0;

        _iLevelScore = 0;

        _fTimeDir = 0;

        _aCell = new Array();
        _aFloor = new Array();
        _aEnemy = new Array();
        _aCanGo = new Array();
        _aTrap = new Array();
        _bDead = false;
        _aWalkableCell = new Array();
        _iTotCoins = 0;

        _iTimeRestart = DIE_RESTART_LEVEL_TIME;
        var oSpriteObject = s_oSpriteLibrary.getSprite("object_0");
        _iObjDim = oSpriteObject.width * 0.5;
        _iDir = 0;

        _iKilledEnemy = 0;

        _fTimeInput = 0;

        _bCharacterAttack = false;

        _bReachPoint = true;

        _iRowCharacter = 0;
        _iCol = 0;

        this.setLevelFloor();
        this.setLevelObject();
        this.createCharacter();
        this.layerCharacter();

        _aCanGo["left"] = false;
        _aCanGo["right"] = false;
        _aCanGo["up"] = false;
        _aCanGo["down"] = false;

        _iOffsetCharacterCol = OFFSET_CHARACTER;
        _iOffsetEnemyCol = CELL_SIZE + OFFSET_COLLLISION_ENEMY;

        if (s_bMobile === false) {
            document.onkeydown = onKeyDown;
            document.onkeyup = onKeyUp;
        } else {
            _oHammer = new Hammer(s_oCanvas);
            _oHammer.get('swipe').set({direction: Hammer.DIRECTION_ALL});
            _oHammer.get('swipe').set({velocity: 0.005});
            _oHammer.get('swipe').set({threshold: 0.1});
            _oHammer.on("swipeleft", function () {
                _szPrevAction = "left";
            });
            _oHammer.on("swiperight", function () {
                _szPrevAction = "right";
            });
            _oHammer.on("swipeup", function () {
                _szPrevAction = "up";
            });
            _oHammer.on("swipedown", function () {
                _szPrevAction = "down";
            });
        }

        _bPressedKeys = false;
        _bCollision = false;
        _iOffsetLeft = OFFSET_SCROLL[_iLevel].left;
        _iOffsetRight = OFFSET_SCROLL[_iLevel].right;
        _iOffsetDown = OFFSET_SCROLL[_iLevel].down;
        _iOffsetUp = OFFSET_SCROLL[_iLevel].up;
        _oInterface = new CInterface();
        _iCellHalfDim = CELL_HALF_SIZE - 2;

        _szAction = "";

        _oInterface.setTotCoin(_iTotCoins);
        _oInterface.refreshTokenMoney(_iToken);

        if (_iLevel === 0)
            _oInterface.helpPag1(_iLevel);
        else
            _oInterface.showLevelNum(_iLevel);

        CHARACTER_SPEED = oData.character_speed;
    ENEMY_SPEED = oData.enemy_speed;
    LIVES = oData.life_character;
    COIN_SCORE = oData.coin_score;
    ENEMY_SCORE_COMBO = oData.score_kill_enemy;
    TIME_BONUS_ATTACK = oData.time_bonus_attack;
    NUM_LEVELS_FOR_ADS = oData.num_levels_for_ads;

        //KSIAKI
        var sGameSettings = CHARACTER_SPEED +
            ':' + ENEMY_SPEED +
            ':' + LIVES +
            ':' + COIN_SCORE +
            ':' + ENEMY_SCORE_COMBO +
            ':' + TIME_BONUS_ATTACK +
            ':' + NUM_LEVELS_FOR_ADS +
            ';';

        _ServerScore = new ServerScore(sGameSettings);

        $(s_oMain).trigger("start_level", _iLevel);
    };
    this.setPause = function (bVal) {
        _bPause = bVal;
    };
    this.onExit = function () {
        setVolume("soundtrack", 1);
        s_oGame.unload();
        s_oMain.gotoMenu();

        $(s_oMain).trigger("end_level", _iLevel);
        $(s_oMain).trigger("end_session");
        $(s_oMain).trigger("show_interlevel_ad");
    };

    this.unload = function () {
        if (s_bMobile) {
            _oHammer.off("swipeleft", function () {
                _oParent._swipeControl("left");
            });
            _oHammer.off("swiperight", function () {
                _oParent._swipeControl("right");
            });
            _oHammer.off("swipeup", function () {
                _oParent._swipeControl("up");
            });
            _oHammer.off("swipedown", function () {
                _oParent._swipeControl("down");
            });
        } else {
            document.onkeydown = null;
            document.onkeyup = null;
        }
        _oInterface.unload();
        createjs.Tween.removeAllTweens();
        s_oStage.removeAllChildren();
    };

    this.setLevelFloor = function () {
        var aLevelPositionFloor = FLOOR_LEVEL_POSITION[_iLevel];
        var aLevelDiagramFloor = FLOOR_LEVEL_DIAGRAM[_iLevel];
        var iRow = aLevelPositionFloor.length;
        var iCol = aLevelPositionFloor[0].length;
        var iXPos;
        var iYPos;
        for (var i = 0; i < iRow; i++) {
            for (var j = 0; j < iCol; j++) {
                iXPos = CELL_SIZE * (j) + CELL_HALF_SIZE;
                iYPos = CELL_SIZE * (i) + CELL_HALF_SIZE;
                if (aLevelPositionFloor[i][j].type !== -1) {
                    var oSpriteFloor = s_oSpriteLibrary.getSprite("floor_" + aLevelPositionFloor[i][j].type);
                    _aFloor.push(new CFloor(iXPos, iYPos, oSpriteFloor, aLevelPositionFloor[i][j].rotation));
                    _aWalkableCell.push({x: iXPos, y: iYPos});
                }
            }
        }
        _iTrapsIndex = s_oScrollStage.numChildren - 1;

        _oEasyStar.setGrid(aLevelDiagramFloor);
        _oEasyStar.setAcceptableTiles(WALKABLE_CELL);
        _oEasyStar.setIterationsPerCalculation(ITERATIONS_PER_CALCULATION);
    };

    this.setLevelObject = function () {
        var aLevelDiagram = OBJECTS_LEVEL_POSITION[_iLevel];
        _iRow = aLevelDiagram.length;
        _iCol = aLevelDiagram[0].length;
        var iObjectNum = 0;
        var iXPos;
        var iYPos;
        for (var i = 0; i < _iRow; i++) {
            _aCell[i] = new Array();
            for (var j = 0; j < _iCol; j++) {
                iXPos = CELL_SIZE * (j) + CELL_HALF_SIZE;
                iYPos = CELL_SIZE * (i) + CELL_HALF_SIZE;
                if (aLevelDiagram[i][j].type !== -1) {
                    var oSpriteObject = s_oSpriteLibrary.getSprite("object_" + aLevelDiagram[i][j].type);
                    _aCell[i][j] = new CCell(iXPos, iYPos, oSpriteObject, aLevelDiagram[i][j].type, iObjectNum, j, i);
                    if (aLevelDiagram[i][j].type === 2) {
                        _iTotCoins++;
                        _aCell[i][j].setTag("item");
                        _aCell[i][j].setOccupied(true);
                        _aCell[i][j].setChildIndex(_iTrapsIndex);
                    } else if (aLevelDiagram[i][j].type === 3 || aLevelDiagram[i][j].type === 5 || aLevelDiagram[i][j].type === 6) {
                        _aCell[i][j].setTag("item");
                        _aCell[i][j].setOccupied(true);
                        if (aLevelDiagram[i][j].type === 6) {
                            _aTrap.push(_aCell[i][j]);
                            _aCell[i][j].setTag("trap");
                            _aCell[i][j].setChildIndex(_iTrapsIndex);
                        }
                    } else {
                        _aCell[i][j].setTag("object");
                    }
                    _aCell[i][j].setCollision(CELL_SIZE + OFFSET_COLLISION_OBJECT[aLevelDiagram[i][j].type]);
                } else {
                    _aCell[i][j] = new CCell(iXPos, iYPos, null, aLevelDiagram[i][j].type, iObjectNum, j, i);
                    _aCell[i][j].setCollision(CELL_SIZE);
                    _aWalkableCell.push({x: iXPos, y: iYPos});
                }
                iObjectNum++;
            }
        }

        if (SHOW_ID_OBJ === true) {
            this.textIdObj(aLevelDiagram);
        }

        this.enemyCreation();
    };

    this.canInput = function (bValue) {
        _bCanInput = bValue;
    };

    this.textIdObj = function (aLevelDiagram) {
        var oIdText;
        var oIdTextStruct;
        var iXPos;
        var iYPos;
        for (var i = 0; i < _iRow; i++) {
            for (var j = 0; j < _iCol; j++) {
                if (aLevelDiagram[i][j].type !== -1) {
                    iXPos = CELL_SIZE * (j) + CELL_HALF_SIZE;
                    iYPos = CELL_SIZE * (i) + CELL_HALF_SIZE;
                    oIdText = new createjs.Text(aLevelDiagram[i][j].id, "normal " + 32 + "px " + PRIMARY_FONT, "#fff");
                    oIdText.textAlign = "center";
                    oIdText.textBaseline = "alphabetic";
                    oIdText.x = iXPos;
                    oIdText.y = iYPos;

                    oIdTextStruct = new createjs.Text(aLevelDiagram[i][j].id, "normal " + 32 + "px " + PRIMARY_FONT, "#000");
                    oIdTextStruct.textAlign = "center";
                    oIdTextStruct.textBaseline = "alphabetic";
                    oIdTextStruct.x = iXPos;
                    oIdTextStruct.y = iYPos;
                    oIdTextStruct.outline = OUTLINE_TEXT;
                    s_oScrollStage.addChild(oIdTextStruct, oIdText);
                }
            }
        }
    };

    this.createCharacter = function () {
        for (var i = 0; i < _iRow; i++) {
            for (var j = 0; j < _iCol; j++) {
                if (CHARACTER_CELL_LEVEL[_iLevel] === _aCell[i][j].getID()) {
                    _oCharacter = new CCharacter(_aCell[i][j].getX(), _aCell[i][j].getY(), _aCell[i][j].getRow(), _aCell[i][j].getCol());
                    _oCharacter.setCollision(CELL_SIZE + OFFSET_CHARACTER);
                    _oStartPosCharacter = {x: _aCell[i][j].getX(), y: _aCell[i][j].getY()};
                    _oStartCellCharacter = {r: _aCell[i][j].getRow(), c: _aCell[i][j].getCol()};
                    this.layerCharacter();
                }
            }
        }
    };

    this.enemyCreation = function () {
        var aLevelEnemy = ENEMY_LEVEL[_iLevel];
        for (var i = 0; i < aLevelEnemy.length; i++) {
            for (var j = 0; j < _iRow; j++) {
                for (var k = 0; k < _iCol; k++) {
                    if (_aCell[j][k].getID() === aLevelEnemy[i].start_cell) {
                        var iX = _aCell[j][k].getX();
                        var iY = _aCell[j][k].getY();
                        _aEnemy[i] = new CEnemy(iX, iY, aLevelEnemy[i].type, _aCell[j][k].getCol(), _aCell[j][k].getRow(), _aCell[j + 1][0].getObjectID());
                        _aEnemy[i].setID(i);
                        _aEnemy[i].setCell(aLevelEnemy[i].start_cell);
                        _aEnemy[i].setCollision(CELL_SIZE + OFFSET_COLLISION_ENEMY[aLevelEnemy[i].type]);
                        _aEnemy[i].setMatrix(k, j);
                        this.layerEnemy(i, j);
                        this.enemyAI(i);
                    }
                }
            }
        }
    };

    this.enemyAI = function (iID) {
        var oMat = _aEnemy[iID].getMatrix();
        var iX = oMat.r;
        var iY = oMat.c;
        var iRand = Math.floor(Math.random() * _aWalkableCell.length);
        var iXEnd = Math.floor(_aWalkableCell[iRand].x / CELL_SIZE);
        var iYEnd = Math.floor(_aWalkableCell[iRand].y / CELL_SIZE);

        _oEasyStar.findPath(iX, iY, iXEnd, iYEnd, function (path) {
            if (path === null) {
                s_oGame.enemyAI(iID);
            } else {
                if (path.length > 2) {
                    _aEnemy[iID].setTrajectory(path);
                } else {
                    s_oGame.enemyAI(iID);
                }
            }
        });

        _oEasyStar.calculate();
    };

    function onKeyDown(evt) {
        if (!_bPressedKeys) {
            if (evt.keyCode === 37) {
                _szPrevAction = "left";
                _bPressedKeys = true;
            } else if (evt.keyCode === 39) {
                _szPrevAction = "right";
                _bPressedKeys = true;
            } else if (evt.keyCode === 38) {
                _szPrevAction = "up";
                _bPressedKeys = true;
            } else if (evt.keyCode === 40) {
                _szPrevAction = "down";
                _bPressedKeys = true;
            }
        }
        if (evt.keyCode === 80) {
            if (!_bPause)
                _oInterface.onButPauseRelease();
            else
                _oInterface.onButContinueRelease();
        }

        if (_bSpaceBarNextLv && evt.keyCode === 32) {
            s_oGame.nextLevelSpaceBar(false);
            _oInterface._onButNextLevelRelease();
        }

        evt.preventDefault();
        return false;
    }

    function onKeyUp(evt) {
        if (_bPressedKeys) {
            if (evt.keyCode === 37) {
                _bPressedKeys = false;
            } else if (evt.keyCode === 39) {
                _bPressedKeys = false;
            } else if (evt.keyCode === 38) {
                _bPressedKeys = false;
            } else if (evt.keyCode === 40) {
                _bPressedKeys = false;
            }
        }

        evt.preventDefault();
        return false;
    }

    this._control = function (szAction) {
        if (_szAction === szAction || !_bCanInput || !_bReachPoint) {
            return;
        }
        switch (szAction) {
            case "right":
                if (_bCharacterAttack === false)
                    this.setCharacterState(1, "walk", "right", 1);
                else
                    this.setCharacterState(1, "attack", "right", 1);
                break;
            case "left":
                if (_bCharacterAttack === false)
                    this.setCharacterState(2, "walk", "left", -1);
                else
                    this.setCharacterState(2, "attack", "left", -1);
                break;
            case "up":
                if (_bCharacterAttack === false)
                    this.setCharacterState(3, "walk", "up", -1);
                else
                    this.setCharacterState(3, "attack", "up", -1);
                break;
            case"down":
                if (_bCharacterAttack === false)
                    this.setCharacterState(0, "walk", "down", 1);
                else
                    this.setCharacterState(0, "attack", "down", 1);
                break;
        }
    };

    this.setCharacterState = function (iVal, szState, szAction, iDir) {
        _szAction = szAction;
        _iDir = iDir;
        _oCharacter.switchHero(iVal);
        _oCharacter.playState(szState);
    };

    this.nextLevel = function () {
        this.unloadLevel();
        _iLevel++;
        this.resetParamForNewLevel();
        this.setLevelFloor();
        this.setLevelObject();
        this.createCharacter();
        this.layerCharacter();
        _oInterface.setTotCoin(_iTotCoins);
        _oInterface.refreshTokenMoney(_iToken);
        _oInterface.showLevelNum(_iLevel);

        // KSIAKI
        _ServerScore.initLevel();

        $(s_oMain).trigger("start_level", _iLevel);
    };

    this.resetParamForNewLevel = function () {
        _bDead = false;
        _iPreRow = -1;
        _iDir = 0;
        _szAction = null;
        _szPrevAction = "";
        _iKilledEnemy = 0;
        _iLevelScore = 0;
        _iToken = 0;
        _iTotCoins = 0;
        s_oScrollStage.x = STAGE_POSITION_LEVEL[_iLevel].x;
        s_oScrollStage.y = STAGE_POSITION_LEVEL[_iLevel].y;
        _iOffsetLeft = OFFSET_SCROLL[_iLevel].left;
        _iOffsetRight = OFFSET_SCROLL[_iLevel].right;
        _iOffsetDown = OFFSET_SCROLL[_iLevel].down;
        _iOffsetUp = OFFSET_SCROLL[_iLevel].up;
        _oInterface.refreshTokenMoney(_iToken);
    };

    this.manageObjects = function () {
        for (var j = -1; j < 2; j++) {
            var iR = _iRowCharacter + j;
            for (var i = -1; i < 2; i++) {
                var iC = _oCharacter.getRow() + i;
                if (_aCell[iR][iC].getOccupied() === true && _aCell[iR][iC].getTag() === "item") {
                    var bCollideMiddle = collisionWithCircle(_aCell[iR][iC], _oCharacter, 0.5);
                    if (bCollideMiddle === true) {
                        this.collisionObject(iC, iR, _szAction);
                        break;
                    }
                } else {
                    if (_aCell[iR][iC].getOccupied() === true && _aCell[iR][iC].getTag() === "trap") {
                        var bCollideMiddle = collisionWithCircle(_aCell[iR][iC], _oCharacter, 0.5);
                        if (bCollideMiddle === true) {
                            this.collisionObject(iC, iR, _szAction);
                            break;
                        }
                    }
                }
            }
        }
    };

    this.prevDirection = function () {

        var iColLeft = _oCharacter.getRow() - 1;
        var iColRight = _oCharacter.getRow() + 1;
        var iRowUp = _oCharacter.getCol() - 1;
        var iRowDown = _oCharacter.getCol() + 1;

        if (_aCell[_oCharacter.getCol()][iColLeft].getTag() !== "object") {
            _aCanGo["left"] = true;
            this.prevAction("left");
        } else {
            _aCanGo["left"] = false;
            this.prevCollision("left");
        }
        if (_aCell[_oCharacter.getCol()][iColRight].getTag() !== "object") {
            _aCanGo["right"] = true;
            this.prevAction("right");
        } else {
            _aCanGo["right"] = false;
            this.prevCollision("right");
        }
        if (_aCell[iRowUp][_oCharacter.getRow()].getTag() !== "object") {
            _aCanGo["up"] = true;
            this.prevAction("up");
        } else {
            _aCanGo["up"] = false;
            this.prevCollision("up");
        }
        if (_aCell[iRowDown][_oCharacter.getRow()].getTag() !== "object") {
            _aCanGo["down"] = true;
            this.prevAction("down");
        } else {
            _aCanGo["down"] = false;
            this.prevCollision("down");
        }
    };

    this.prevAction = function (szPrev) {
        if (_szPrevAction === szPrev) {
            this._control(_szPrevAction);
            _szPrevAction = "";
        }
    };

    this.prevCollision = function (szState) {
        if (_szAction === szState) {
            _iDir = 0;
            _oCharacter.playState("idle");
            _szAction = "";
        }
    };

    this.collisionObject = function (i, iRow, szAction) {
        if (_fTimeCol > 0) {
            return;
        }
        _fTimeCol = COLLISION_DETECTION_OFFSET;
        var iObjX = _aCell[iRow][i].getX();
        var iObjY = _aCell[iRow][i].getY();
        var iObjType = _aCell[iRow][i].getType();
        if (iObjType === 0 || iObjType === 1 || iObjType === 4 || iObjType === 5) {
            switch (szAction) {
                case "left":
                    if (_oCharacter.getX() > iObjX)
                        _oCharacter.setPosition(_aCell[iRow][i + 1].getX(), _oCharacter.getY());
                    break;
                case "right":
                    if (_oCharacter.getX() < iObjX)
                        _oCharacter.setPosition(_aCell[iRow][i - 1].getX(), _oCharacter.getY());
                    break;
                case "up":
                    if (_oCharacter.getY() > iObjY)
                        _oCharacter.setPosition(_oCharacter.getX(), _aCell[iRow + 1][i].getY());
                    break;
                case "down":
                    if (_oCharacter.getY() < iObjY)
                        _oCharacter.setPosition(_oCharacter.getX(), _aCell[iRow - 1][i].getY());
                    break;
            }
            _iDir = 0;
            _oCharacter.playState("idle");
            if (iObjType === 5) {
                _aCell[iRow][i].activeExplosive();
            }
        } else if (iObjType === 2) {
            this.refreshScore(COIN_SCORE);
            this.addEffectCoin(iObjX, iObjY);
            this.unloadObject(iRow, i);
            _iTotCoins--;
            playSound("money", 1, false);
            this.totCoins();
        } else if (iObjType === 3) {
            this.unloadObject(iRow, i);
            this.activeBonusAttack();
        } else if (iObjType === 6) {
            if (_aCell[iRow][i].getTrapOut() === true) {
                this.characterDead();
            }
        }
    };

    this.borrowExplosion = function (iXPos, iYPos) {
        this.displayShock();
        playSound("barrel_explosion", 1, false);
        for (var i = 0; i < _aEnemy.length; i++) {
            var iDx = _aEnemy[i].getX() - iXPos;
            var iDy = _aEnemy[i].getY() - iYPos;
            var fdistance = Math.sqrt((iDx * iDx) + (iDy * iDy));
            if (fdistance < _aEnemy[i].getCollision() * 0.5 + BORROW_EXPLOSION_RANGE) {
                _aEnemy[i].dead();
                this.addEffectScore(_aEnemy[i].getX(), _aEnemy[i].getY(), ENEMY_SCORE_COMBO[_iComboAttack]);
                this.addScoreEnemy();
            }
        }

        var iDx = _oCharacter.getX() - iXPos;
        var iDy = _oCharacter.getY() - iYPos;
        var fdistance = Math.sqrt((iDx * iDx) + (iDy * iDy));
        if (fdistance < _oCharacter.getCollision() * 0.5 + BORROW_EXPLOSION_RANGE) {
            this.characterDead();
        }

        _iComboAttack = 0;
    };

    this.activeBonusAttack = function () {
        if (_bCharacterAttack === false) {
            _bCharacterAttack = true;
            _oCharacter.playState("attack");
            playSound("power_up", 1, false);
        }
        _fTimeBonusAttack = TIME_BONUS_ATTACK;
    };

    this.totCoins = function () {
        _iToken++;
        _oInterface.refreshTokenMoney(_iToken);
        if (_iTotCoins < 0) {
            return;
        } else {
            this.setPause(true);
            this.canInput(false);
            _oInterface.levelComplete(_iLevel, _iScore, _iKilledEnemy, _iLevelScore);
            _iLevelAds++;
            _oCharacter.playState("idle");
            this.killAllEnemy();
            if (_iLevelAds === NUM_LEVELS_FOR_ADS) {
                _iLevelAds = 0;
                $(s_oMain).trigger("show_interlevel_ad");
            }
            if (s_iLevelReached < _iLevel + 2) {
                s_iLevelReached = _iLevel + 2;
            }

            //KSIAKI
            _ServerScore.send(_iLevel+1, _iLevelScore, _iScore, 1);

            $(s_oMain).trigger("end_level", _iLevel);
        }
    };

    this.nextLevelSpaceBar = function (bVal) {
        _bSpaceBarNextLv = bVal;
    };

    this.killAllEnemy = function () {
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].dead();
        }
    };

    this.scrollWorld = function (iCharX, iCharY) {
        if (iCharX < _iOffsetLeft && _szAction === "left") {
            if (s_oScrollStage.x < OFFSET_LEVEL_MAP_LEFT) {
                s_oScrollStage.x += CHARACTER_SPEED;
                _iOffsetLeft -= CHARACTER_SPEED;
                _iOffsetRight -= CHARACTER_SPEED;
            } else {
                _iOffsetLeft = OFFSET_SCROLL[_iLevel].left;
            }
        } else if (iCharX > _iOffsetRight && _szAction === "right") {
            if (s_oScrollStage.x > OFFSET_LEVEL_MAP_RIGHT) {
                s_oScrollStage.x -= CHARACTER_SPEED;
                _iOffsetLeft += CHARACTER_SPEED;
                _iOffsetRight += CHARACTER_SPEED;
            }
        } else if (iCharY < _iOffsetUp && _szAction === "up") {
            if (s_oScrollStage.y < OFFSET_LEVEL_MAP_UP) {
                s_oScrollStage.y += CHARACTER_SPEED;
                _iOffsetUp -= CHARACTER_SPEED;
                _iOffsetDown -= CHARACTER_SPEED;
            }
        } else if (iCharY > _iOffsetDown && _szAction === "down") {
            if (s_oScrollStage.y > OFFSET_LEVEL_MAP_DOWN) {
                s_oScrollStage.y -= CHARACTER_SPEED;
                _iOffsetUp += CHARACTER_SPEED;
                _iOffsetDown += CHARACTER_SPEED;
            }
        }
    };

    this.restartLevelFromGameOver = function () {
        _iLife = LIVES + 1;
        _oInterface.refreshLife(_iLife);
        _iScore = 0;
        _iToken = 0;
        _oInterface.refreshScore(_iScore);
        $(s_oMain).trigger("restart_level", _iLevel);

        for (var i = 0; i < _aCell.length; i++) {
            for (var j = 0; j < _aCell[i].length; j++) {
                _aCell[i][j].unload();
            }
        }

        var iCnt = 0;
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].unload();
            iCnt++;
        }
        _aEnemy.splice(0, iCnt);

        _oCharacter.switchHero(0);
        _oCharacter.playState("idle");
        _oCharacter.setPosition(_oStartPosCharacter.x, _oStartPosCharacter.y);
        _oCharacter.setRow(_oStartCellCharacter.r);
        _oCharacter.setCol(_oStartCellCharacter.c);

        _szAction = null;
        _szPrevAction = "";

        _oInterface.refreshTokenMoney(_iToken);

        s_oScrollStage.x = STAGE_POSITION_LEVEL[_iLevel].x;
        s_oScrollStage.y = STAGE_POSITION_LEVEL[_iLevel].y;
        _iOffsetLeft = OFFSET_SCROLL[_iLevel].left;
        _iOffsetRight = OFFSET_SCROLL[_iLevel].right;
        _iOffsetDown = OFFSET_SCROLL[_iLevel].down;
        _iOffsetUp = OFFSET_SCROLL[_iLevel].up;

        _aCell = new Array();
        _aEnemy = new Array();

        _iPreRow = -1;

        _iLevelScore = 0;
        _iDir = 0;
        _iTotCoins = 0;

        _iKilledEnemy = 0;

        this.setLevelObject();
        this.layerCharacter();
        _oInterface.showLevelNum(_iLevel);
    };

    this.startAnimEnemy = function (szState) {
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].changeState(szState);
        }
    };

    this.characterDead = function () {
        this.setPause(true);
        _bDead = true;
        playSound("pirate_death", 1, false);
        _oCharacter.playState("die");
        this.canInput(false);
    };

    this.enemyCollision = function () {
        for (var i = 0; i < _iCol; i++) {
            for (var j = 0; j < _aEnemy.length; j++) {
                if (_aEnemy[j].getDead() === false) {
                    var bCollide = collisionWithCircle(_aEnemy[j], _oCharacter, 0.5);
                    if (bCollide === true && _bCharacterAttack === false) {
                        _aEnemy[j].playerKilled(true);
                        this.characterDead();
                        break;
                    } else if (bCollide === true && _bCharacterAttack === true) {
                        var oCell = _aEnemy[j].getMatrix();
                        this.addEffectScore(_aEnemy[j].getX(), _aEnemy[j].getY(), ENEMY_SCORE_COMBO[_iComboAttack]);
                        _aEnemy[j].dead();
                        this.addScoreEnemy();
                        _iKilledEnemy++;
                        playSound("enemy_death", 1, false);
                        if (_aCell[oCell.r][oCell.c].getTag() === "enemy") {
                            _aCell[oCell.r][oCell.c].setOccupied(false);
                            _aCell[oCell.r][oCell.c].setTag("nothing");
                        }
                        break;
                    }
                }
            }
        }
    };

    this.addScoreEnemy = function () {
        this.refreshScore(ENEMY_SCORE_COMBO[_iComboAttack]);

        if (_iComboAttack < ENEMY_SCORE_COMBO.length - 1)
            _iComboAttack++;
    };

    this.addEffectScore = function (iX, iY, iScore) {
        var oScoreContainer;

        var oScore;
        var oScoreStruct;

        oScore = new createjs.Text("+" + iScore, "normal " + 50 + "px " + PRIMARY_FONT, "#ffb400");
        oScore.textAlign = "center";
        oScore.textBaseline = "alphabetic";
        oScore.x = 0;
        oScore.y = 0;

        oScoreStruct = new createjs.Text("+" + iScore, "normal " + 50 + "px " + PRIMARY_FONT, "#000000");
        oScoreStruct.textAlign = "center";
        oScoreStruct.textBaseline = "alphabetic";
        oScoreStruct.x = 2;
        oScoreStruct.y = 2;

        oScoreContainer = new createjs.Container();
        oScoreContainer.addChild(oScoreStruct, oScore);
        oScoreContainer.alpha = 0;
        oScoreContainer.x = iX;
        oScoreContainer.y = iY;

        s_oScrollStage.addChild(oScoreContainer);

        createjs.Tween.get(oScoreContainer).to({alpha: 1, y: iY - 50}, 1000, createjs.Ease.cubicOut).call(function () {
            createjs.Tween.get(oScoreContainer).to({alpha: 0, y: iY - 100}, 1000, createjs.Ease.cubicIn).call(function () {
                s_oScrollStage.removeChild(oScoreContainer);
            });
        });
    };

    this.enemyMovement = function () {
        for (var i = 0; i < _aEnemy.length; i++) {
            var bBreak = false;
            if (_aEnemy[i].getDead() === false) {
                for (var j = 0; j < _iRow; j++) {
                    for (var k = 0; k < _iCol; k++) {
                        var bCollide = collisionWithCircle(_aEnemy[i], _aCell[j][k], 0.5);
                        if (bCollide === true) {
                            if (_aCell[j][k].getOccupied() === false && _aCell[j][k].getTag() !== "item" || _aCell[j][k].getTag() !== "object") {
                                var oMat = _aEnemy[i].getMatrix();
                                if (oMat.c !== j) {
                                    this.layerEnemy(i, j);
                                }
                                _aEnemy[i].setCell(_aCell[j][k].getID());
                                _aEnemy[i].setMatrix(k, j);
                                bBreak = true;
                            }
                            break;
                        } else {
                            if (_aCell[j][k].getTag() === "enemy") {
                                _aCell[j][k].setOccupied(false);
                                _aCell[j][k].setTag("nothing");
                            }
                        }
                        if (bBreak)
                            break;
                    }
                }

                this.canEnemyAttackThePlayer(i);

                _aEnemy[i].update();

                if (_bCharacterAttack === false) {
                    if (_aEnemy[i].getEscape()) {
                        _aEnemy[i].setEscape(false);
                        _aEnemy[i].changeState("walk");
                    }
                    if (_aEnemy[i].getFollowMode()) {
                        this.targetMovement(i);
                    }
                } else {
                    if (!_aEnemy[i].getEscape()) {
                        _aEnemy[i].setEscape(true);
                        _aEnemy[i].changeState("escape");
                    }
                    if (_aEnemy[i].getFollowMode()) {
                        this.enemyAI(i);
                        _aEnemy[i].followMode(false);
                    }
                }

                if (_aEnemy[i].pathFinished() === true && _aEnemy[i].getFollowMode() === false) {
                    this.enemyAI(i);
                }

            }
        }
    };

    this.layerEnemy = function (iID, iRow) {
        for (var i = 0; i < _aCell[iRow].length; i++) {
            if (_aCell[iRow][i].getTag() === "object" && _aCell[iRow][i].onlyCollision() === false) {
                _aEnemy[iID].setChildIndex(_aCell[iRow][i].getObjectID());
                break;
            }
        }
    };

    this.canEnemyAttackThePlayer = function (iID) {
        if (_bCharacterAttack === true || _aEnemy[iID].getIgnorePlayer()) {
            _aEnemy[iID].canFollow(false);
        } else {
            _aEnemy[iID].canFollow(true);
        }
    };

    this.findTarget = function (iID, bSearch) {
        var oCell = _aEnemy[iID].getCurrentCell();
        var bDetect;

        var iDx = _aEnemy[iID].getX() - _oCharacter.getX();
        var iDy = _aEnemy[iID].getY() - _oCharacter.getY();
        var fdistance = Math.sqrt((iDx * iDx) + (iDy * iDy));
        if (fdistance < _oCharacter.getCollision() * 0.5 + RANGE_ENEMY_DETECTION[_aEnemy[iID].getType()] * 0.5) {
            bDetect = true;
        } else {
            bDetect = false;
        }

        if (bDetect === true) {
            var iX = oCell.r;
            var iY = oCell.c;
            var iXEnd = _oCharacter.getRow();
            var iYEnd = _oCharacter.getCol();

            _oEasyStar.findPath(iX, iY, iXEnd, iYEnd, function (path) {
                if (path === null || path.length < 1) {
                    _aEnemy[iID].existingPath(false);
                    _aEnemy[iID].ignorePlayer(true);
                    _aEnemy[iID].canFollow(false);
                    _aEnemy[iID].followMode(false);
                    s_oGame.enemyAI(iID);
                } else {
                    _aEnemy[iID].existingPath(true);
                    if (bSearch === true)
                        _aEnemy[iID].setTrajectory(path);
                    _aEnemy[iID].setTargetCoordinate(iXEnd, iYEnd);
                    _aEnemy[iID].setTargetMove(false);
                }
            });
        } else {
            _aEnemy[iID].existingPath(false);
            _aEnemy[iID].followMode(false);
        }
    };

    this.targetMovement = function (iID) {
        var oTarget = _aEnemy[iID].getTargetCoordinate();
        var iR = oTarget.r;
        var iC = oTarget.c;
        if (_oCharacter.getCol() !== iC || _oCharacter.getRow() !== iR) {
            _aEnemy[iID].targetMoved(true);
        }
    };

    this.timeRestartLevel = function () {
        _iTimeRestart -= 1 / createjs.Ticker.framerate;
        if (_iTimeRestart <= 0) {
            _bDead = false;
            s_oGame.restartLevel();
            _iTimeRestart = DIE_RESTART_LEVEL_TIME;
        }
    };

    this.life = function (iValue) {
        _iLife += iValue;
        _oInterface.refreshLife(_iLife);
    };

    this.restartLevel = function () {
        if (_iLife > 0) {
            s_oGame.life(-1);
            var iCnt = 0;
            for (var i = 0; i < _aEnemy.length; i++) {
                _aEnemy[i].unload();
                iCnt++;
            }
            _aEnemy.splice(0, iCnt);
            this.enemyCreation();
            _oCharacter.switchHero(0);
            _oCharacter.playState("idle");
            _oCharacter.setPosition(_oStartPosCharacter.x, _oStartPosCharacter.y);
            _oCharacter.setRow(_oStartCellCharacter.r);
            _oCharacter.setCol(_oStartCellCharacter.c);

            _iPreRow = -1;

            this.layerCharacter();

            _iDir = 0;
            _szAction = null;
            _szPrevAction = "";
            _oInterface.showLevelNum(_iLevel);
            s_oScrollStage.x = STAGE_POSITION_LEVEL[_iLevel].x;
            s_oScrollStage.y = STAGE_POSITION_LEVEL[_iLevel].y;
            _iOffsetLeft = OFFSET_SCROLL[_iLevel].left;
            _iOffsetRight = OFFSET_SCROLL[_iLevel].right;
            _iOffsetDown = OFFSET_SCROLL[_iLevel].down;
            _iOffsetUp = OFFSET_SCROLL[_iLevel].up;
        } else {
            _oInterface.refreshScore(_iScore);
            _oInterface.gameOver(_iScore);
        }
    };

    this.timeBonusAttack = function (fFPS) {
        if (_fTimeBonusAttack > 0) {
            _fTimeBonusAttack -= 1 / fFPS;
        } else {
            if (_bCharacterAttack === true) {
                _bCharacterAttack = false;
                if (_iDir === 0)
                    _oCharacter.playState("idle");
                else
                    _oCharacter.playState("walk");

                _iComboAttack = 0;
            }
        }
    };

    this.layerCharacter = function () {
        for (var i = 0; i < _iRow; i++) {
            if (_oCharacter.getY() > _aCell[i][0].getY() - _iCellHalfDim && _oCharacter.getY() < _aCell[i][0].getY() + _iCellHalfDim) {
                _iRowCharacter = i;
                for (var j = 0; j < _aCell[_oCharacter.getCol()].length; j++) {
                    if (_aCell[_oCharacter.getCol()][j].getTag() === "object" && _aCell[_oCharacter.getCol()][j].onlyCollision() === false && _iRowCharacter !== _iPreRow) {
                        _oCharacter.setChildIndex((_aCell[_oCharacter.getCol()][j].getObjectID()));
                        _iPreRow = _oCharacter.getCol();
                        break;
                    }
                }
                break;
            }
        }
    };

    this.displayShock = function () {
        var xShifting = DISPLAY_SHOCK_X;
        var yShifting = DISPLAY_SHOCK_Y;

        createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting), y: Math.round(Math.random() * yShifting)}, 50).call(function () {
            createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting * 0.8), y: -Math.round(Math.random() * yShifting * 0.8)}, 50).call(function () {
                createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting * 0.6), y: Math.round(Math.random() * yShifting * 0.6)}, 50).call(function () {
                    createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting * 0.4), y: -Math.round(Math.random() * yShifting * 0.4)}, 50).call(function () {
                        createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting * 0.2), y: Math.round(Math.random() * yShifting * 0.2)}, 50).call(function () {
                            createjs.Tween.get(s_oStage).to({x: Math.round(Math.random() * xShifting), y: -Math.round(Math.random() * yShifting)}, 50).call(function () {
                                createjs.Tween.get(s_oStage).to({y: 0, x: 0}, 50).call(function () {
                                });
                            });
                        });
                    });
                });
            });
        });

    };

    this.characterCell = function () {
        var bFlag = false;
        for (var i = -1; i < 2; i++) {
            var iR = _oCharacter.getCol() + i;
            if (iR > 0 && iR < _iRow) {
                for (var j = 0; j < _iCol; j++) {
                    var bCollide = collisionWithCircle(_oCharacter, _aCell[iR][j], 0.05);
                    if (bCollide === true) {
                        bFlag = true;
                        _oCharacter.setCol(_aCell[iR][j].getCol());
                        _oCharacter.setRow(_aCell[iR][j].getRow());
                        if (_aCell[iR][j].getOccupied() === false && _aCell[iR][j].getTag() !== "object") {
                            _oCharacter.setCell(_aCell[iR][j].getID());
                            if (_aCell[iR][j].getTag() !== "trap" || _aCell[iR][j].getTag() !== "item") {
                                _aCell[iR][j].setOccupied(true);
                                _aCell[iR][j].setTag("player");
                            }
                        }
                        break;
                    } else {
                        if (_aCell[iR][j].getTag() === "player") {
                            _aCell[iR][j].setOccupied(false);
                            _aCell[iR][j].setTag("nothing");
                        }
                    }
                }
            }
        }
        if (bFlag) {
            _bReachPoint = true;
            this.prevDirection();
        } else {
            if (_aCanGo[_szAction] === false) {
                _bReachPoint = false;
            }
            else {
                _bReachPoint = true;
            }

        }
    };

    this.manageTrap = function (fFPS) {
        for (var i = 0; i < _aTrap.length; i++) {
            _aTrap[i].update(fFPS);
        }
    };

    this.refreshScore = function (iValue) {
        _iScore += iValue;
        _iLevelScore += iValue;
        _oInterface.refreshScore(_iScore);
    };

    this.unloadLevel = function () {
        for (var i = 0; i < _aCell.length; i++) {
            for (var j = 0; j < _aCell[i].length; j++) {
                _aCell[i][j].unload();
            }
        }

        for (var i = 0; i < _aFloor.length; i++) {
            _aFloor[i].unload();
        }


        var iCnt = 0;
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].unload();
            iCnt++;
        }
        _aEnemy.splice(0, iCnt);

        _oCharacter.unload();

        _aCell = new Array();
        _aFloor = new Array();
        _aEnemy = new Array();
        _aCanGo = new Array();
        _aTrap = new Array();
        _aWalkableCell = new Array();

        _fTimeBonusAttack = 0;
        _bCharacterAttack = false;

    };

    this.addEffectCoin = function (iX, iY) {
        var iType = 2;

        var oMoney;

        var oSprite = s_oSpriteLibrary.getSprite("object_" + iType);

        var oData = {
            images: [oSprite],
            // width, height & registration point of each sprite
            frames: {width: (oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width), height: oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height, regX: (oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width + OFFSET_REG_OBJECT[iType].x, regY: (oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height + OFFSET_REG_OBJECT[iType].y},
            animations: OBJECT_SPRITESHEET_NUM[iType].animations
        };
        var oSpriteSheetHeroBottom = new createjs.SpriteSheet(oData);
        oMoney = createSprite(oSpriteSheetHeroBottom, "normal", ((oSprite.width / 2) / OBJECT_SPRITESHEET_NUM[iType].width) + OFFSET_REG_OBJECT[iType].x, ((oSprite.height / 2) / OBJECT_SPRITESHEET_NUM[iType].height) + OFFSET_REG_OBJECT[iType].y, oSprite.width / OBJECT_SPRITESHEET_NUM[iType].width, oSprite.height / OBJECT_SPRITESHEET_NUM[iType].height);
        oMoney.gotoAndStop(0);

        oMoney.x = iX + s_oScrollStage.x;
        oMoney.y = iY;

        s_oStage.addChild(oMoney);

        var oPos = _oInterface.getCoinSpriteCoordinate();

        createjs.Tween.get(oMoney).to({x: oPos.x}, 1000, createjs.Ease.cubicOut).call(function () {
            createjs.Tween.get(oMoney).to({y: oPos.y}, 1000, createjs.Ease.cubicOut).call(function () {
                s_oStage.removeChild(oMoney);
            });
        });

    };

    this.pauseEnemyAnimation = function () {
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].pauseAnimation();
        }
    };

    this.resumeEnemyAnimation = function () {
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].resumeAnimation();
        }
    };

    this.unloadObject = function (iRow, iCol) {
        _aCell[iRow][iCol].setOccupied(false);
        _aCell[iRow][iCol].setTag("nothing");
        _aCell[iRow][iCol].unload();
    };

    this.unloadEnemy = function (iID) {
        _aEnemy[iID].unload();
        _aEnemy.splice(iID, 1);
        for (var i = 0; i < _aEnemy.length; i++) {
            _aEnemy[i].setID(i);
        }
    };

    this.update = function () {
        var fFPS = createjs.Ticker.framerate;
        if (_bPause === false) {

            var iCharX = _oCharacter.getX();
            var iCharY = _oCharacter.getY();
            this.scrollWorld(iCharX, iCharY);

            this.layerCharacter();

            this.characterCell();

            this.enemyMovement();

            this.enemyCollision();

            this.manageObjects();

            this.manageTrap(fFPS);

            _oCharacter.update(_iDir, _szAction);

            this.timeBonusAttack(fFPS);

            _oEasyStar.calculate();

        }
        if (_bDead === true)
            this.timeRestartLevel();


        if (_fTimeCol > 0) {
            _fTimeCol -= 1 / fFPS;
        }

        if (SHOW_FPS === true) {
            _oInterface.refreshFPS();
        }
    };

    s_oGame = this;
    CHARACTER_SPEED = oData.character_speed;
    ENEMY_SPEED = oData.enemy_speed;
    LIVES = oData.life_character;
    COIN_SCORE = oData.coin_score;
    ENEMY_SCORE_COMBO = oData.score_kill_enemy;
    TIME_BONUS_ATTACK = oData.time_bonus_attack;
    NUM_LEVELS_FOR_ADS = oData.num_levels_for_ads;
    this._init();
}

var s_oGame;
var s_oScrollStage;