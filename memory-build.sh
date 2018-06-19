#!/bin/sh

cat app/games/memory/js_src/jquery-2.0.3.min.js \
    app/games/memory/js_src/createjs-2013.12.12.min.js \
    app/games/memory/js_src/ctl_utils.js \
    app/games/memory/js_src/sprite_lib.js \
    app/games/memory/js_src/settings.js \
    app/games/memory/js_src/CLang.js \
    app/games/memory/js_src/CPreloader.js \
    app/games/memory/js_src/CMain.js \
    app/games/memory/js_src/CTextButton.js \
    app/games/memory/js_src/CGfxButton.js \
    app/games/memory/js_src/CToggle.js \
    app/games/memory/js_src/CMenu.js \
    app/games/memory/js_src/CGame.js \
    app/games/memory/js_src/CCard.js \
    app/games/memory/js_src/CLevels.js \
    app/games/memory/js_src/CNextLevel.js \
    app/games/memory/js_src/CInterface.js \
    app/games/memory/js_src/CGameOver.js \
    app/games/memory/js_src/CVictory.js \
    app/games/memory/js_src/CCredits.js > app/games/memory/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/memory/js/memory.min.js app/games/memory/js_src/concat.js
rm app/games/memory/js_src/concat.js

echo "JS uglification successful"

exit 0
