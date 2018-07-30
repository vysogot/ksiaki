#!/bin/sh

# Run `bash build.sh` from within the theme's directory whenever
# you need to perform these tasks.

# Concatenate all JS files to into `site.js`
# Explicitly name and order the files if needed

cat app/games/gems/js_src/jquery-2.0.3.min.js \
    app/games/gems/js_src/createjs.min.js \
    app/games/gems/js_src/howler.min.js \
    app/games/gems/js_src/screenfull.js \
    app/games/gems/js_src/ctl_utils.js \
    app/games/gems/js_src/sprite_lib.js \
    app/games/gems/js_src/ServerScore.js \
    app/games/gems/js_src/settings.js \
    app/games/gems/js_src/CLocalStorage.js \
    app/games/gems/js_src/CLang.js \
    app/games/gems/js_src/CPreloader.js \
    app/games/gems/js_src/CMain.js \
    app/games/gems/js_src/CTextButton.js \
    app/games/gems/js_src/CToggle.js \
    app/games/gems/js_src/CGfxButton.js \
    app/games/gems/js_src/CMenu.js \
    app/games/gems/js_src/CGame.js \
    app/games/gems/js_src/CInterface.js \
    app/games/gems/js_src/CEndPanel.js \
    app/games/gems/js_src/CCell.js \
    app/games/gems/js_src/CLevelMenu.js \
    app/games/gems/js_src/CLevelBut.js \
    app/games/gems/js_src/CHelpPanel.js \
    app/games/gems/js_src/CScrollingBg.js \
    app/games/gems/js_src/CCreditsPanel.js \
    app/games/gems/js_src/CModeMenu.js \
    app/games/gems/js_src/CMsgBox.js \
    app/games/gems/js_src/levelsettings.js \
    app/games/gems/js_src/gameplay.js > app/games/gems/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/gems/js/gems.min.js app/games/gems/js_src/concat.js
rm app/games/gems/js_src/concat.js

echo "JS uglification successful"

exit 0
