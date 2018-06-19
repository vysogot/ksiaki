function CFloor(iXPos, iYPos, oSprite, iRotation) {
    var _oFloor;

    this._init = function (iXPos, iYPos, oSprite, iRotation) {
        
        _oFloor = createBitmap(oSprite);

        _oFloor.regX = (oSprite.width * 0.5);
        _oFloor.regY = (oSprite.height * 0.5);

        _oFloor.x = iXPos;
        _oFloor.y = iYPos;

        _oFloor.rotation = iRotation;

        s_oScrollStage.addChild(_oFloor);

    };

    this.unload = function () {
        s_oScrollStage.removeChild(_oFloor);
        _oFloor = null;
        s_oFloor = null;
    };

    s_oFloor = this;

    this._init(iXPos, iYPos, oSprite, iRotation);
}

var s_oFloor;