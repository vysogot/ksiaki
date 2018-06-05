#!/bin/sh

# Run `bash build.sh` from within the theme's directory whenever 
# you need to perform these tasks.

# Concatenate all JS files to into `site.js`
# Explicitly name and order the files if needed

cat app/games/sorcerer/js_src/jquery-3.1.1.min.js \
    app/games/sorcerer/js_src/createjs-2015.11.26.min.js \
    app/games/sorcerer/js_src/howler.min.js \
    app/games/sorcerer/js_src/ctl_utils.js \
    app/games/sorcerer/js_src/screenfull.js \
    app/games/sorcerer/js_src/settings.js \
    app/games/sorcerer/js_src/sprite_lib.js \
    app/games/sorcerer/js_src/C*.js > app/games/sorcerer/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/sorcerer/js/sorcerer.min.js app/games/sorcerer/js_src/concat.js
rm app/games/sorcerer/js_src/concat.js

echo "JS uglification successful"

exit 0
