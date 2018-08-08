#!/bin/sh

# Run `bash build.sh` from within the theme's directory whenever
# you need to perform these tasks.

# Concatenate all JS files to into `site.js`
# Explicitly name and order the files if needed


# app/games/pirate/js_src/easystar-0.2.3.min.js \

cat app/games/pirate/js_src/jquery-3.2.1.min.js \
    app/games/pirate/js_src/createjs-2015.11.26.min.js \
    app/games/pirate/js_src/howler.min.js \
    app/games/pirate/js_src/screenfull.js \
    app/games/pirate/js_src/hammer.min.js \
    app/games/pirate/js_src/ctl_utils.js \
    app/games/pirate/js_src/sprite_lib.js \
    app/games/pirate/js_src/ServerScore.js \
    app/games/pirate/js_src/floor_settings.js \
    app/games/pirate/js_src/objects_settings.js \
    app/games/pirate/js_src/settings.js \
    app/games/pirate/js_src/CLang.js \
    app/games/pirate/js_src/CPreloader.js \
    app/games/pirate/js_src/CMain.js \
    app/games/pirate/js_src/CTextButton.js \
    app/games/pirate/js_src/CTextToggle.js \
    app/games/pirate/js_src/CToggle.js \
    app/games/pirate/js_src/CNumToggle.js \
    app/games/pirate/js_src/CGfxButton.js \
    app/games/pirate/js_src/CMenu.js \
    app/games/pirate/js_src/CGame.js \
    app/games/pirate/js_src/CInterface.js \
    app/games/pirate/js_src/CCell.js \
    app/games/pirate/js_src/CCharacter.js \
    app/games/pirate/js_src/CEnemy.js \
    app/games/pirate/js_src/CFloor.js \
    app/games/pirate/js_src/CLevelMenu.js \
    app/games/pirate/js_src/CLevelBut.js \
    app/games/pirate/js_src/CCreditsPanel.js > app/games/pirate/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/pirate/js/pirate.min.js app/games/pirate/js_src/concat.js
rm app/games/pirate/js_src/concat.js

echo "JS uglification successful"

exit 0
