#!/bin/sh

cat app/games/sorcerer/js_src/jquery-3.1.1.min.js \
    app/games/sorcerer/js_src/createjs-2015.11.26.min.js \
    app/games/sorcerer/js_src/howler.min.js \
    app/games/sorcerer/js_src/screenfull.js \
    app/games/sorcerer/js_src/ctl_utils.js \
    app/games/sorcerer/js_src/sprite_lib.js \
    app/games/sorcerer/js_src/settings.js \
    app/games/sorcerer/js_src/CLang.js \
    app/games/sorcerer/js_src/CPreloader.js \
    app/games/sorcerer/js_src/CMain.js \
    app/games/sorcerer/js_src/CTextButton.js \
    app/games/sorcerer/js_src/CGfxButton.js \
    app/games/sorcerer/js_src/CToggle.js \
    app/games/sorcerer/js_src/CMenu.js \
    app/games/sorcerer/js_src/CGame.js \
    app/games/sorcerer/js_src/CInterface.js \
    app/games/sorcerer/js_src/CEndPanel.js \
    app/games/sorcerer/js_src/CTweenController.js \
    app/games/sorcerer/js_src/CLevelSettings.js \
    app/games/sorcerer/js_src/CHero.js \
    app/games/sorcerer/js_src/CBezier.js \
    app/games/sorcerer/js_src/CBall.js \
    app/games/sorcerer/js_src/CNextLevel.js \
    app/games/sorcerer/js_src/CExtraScore.js \
    app/games/sorcerer/js_src/CLevelMenu.js \
    app/games/sorcerer/js_src/CLevelBut.js \
    app/games/sorcerer/js_src/CMsgBox.js \
    app/games/sorcerer/js_src/CCreditsPanel.js \
    app/games/sorcerer/js_src/CAlertSavingBox.js \
    app/games/sorcerer/js_src/gameplay.js > app/games/sorcerer/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/sorcerer/js/sorcerer.min.js app/games/sorcerer/js_src/concat.js
rm app/games/sorcerer/js_src/concat.js

echo "JS uglification successful"

exit 0
