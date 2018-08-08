#!/bin/sh

cat app/games/cars/js_src/jquery-2.0.3.min.js \
    app/games/cars/js_src/createjs-2014.12.12.min.js \
    app/games/cars/js_src/screenfull.js \
    app/games/cars/js_src/howler.min.js \
    app/games/cars/js_src/ctl_utils.js \
    app/games/cars/js_src/sprite_lib.js \
    app/games/cars/js_src/ServerScore.js \
    app/games/cars/js_src/settings.js \
    app/games/cars/js_src/CLang.js \
    app/games/cars/js_src/CPreloader.js \
    app/games/cars/js_src/CMain.js \
    app/games/cars/js_src/CCreditsPanel.js \
    app/games/cars/js_src/CTextButton.js \
    app/games/cars/js_src/CToggle.js \
    app/games/cars/js_src/CGfxButton.js \
    app/games/cars/js_src/CMenu.js \
    app/games/cars/js_src/CGame.js \
    app/games/cars/js_src/CInterface.js \
    app/games/cars/js_src/CHelpPanel.js \
    app/games/cars/js_src/CEndPanel.js \
    app/games/cars/js_src/CPlayer.js \
    app/games/cars/js_src/CRenderer.js \
    app/games/cars/js_src/CRoad.js \
    app/games/cars/js_src/CCar.js \
    app/games/cars/js_src/CLevelBuilder.js \
    app/games/cars/js_src/CWorldMenu.js \
    app/games/cars/js_src/CTrackMenu.js \
    app/games/cars/js_src/CLevelBut.js \
    app/games/cars/js_src/levelsettings.js \
    app/games/cars/js_src/CHorizon.js \
    app/games/cars/js_src/CBackground.js \
    app/games/cars/js_src/CNextLevelPanel.js \
    app/games/cars/js_src/CRollingText.js \
    app/games/cars/js_src/CLocalStorage.js \
    app/games/cars/js_src/CLosePanel.js \
    app/games/cars/js_src/CTimer.js \
    app/games/cars/js_src/CTachometer.js \
    app/games/cars/js_src/CMsgBox.js \
    app/games/cars/js_src/CTremble.js \
    app/games/cars/js_src/CAreYouSurePanel.js > app/games/cars/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/cars/js/cars.min.js app/games/cars/js_src/concat.js
rm app/games/cars/js_src/concat.js

echo "JS uglification successful"

exit 0
