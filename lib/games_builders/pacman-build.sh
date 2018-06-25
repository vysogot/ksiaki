#!/bin/sh

cat app/games/pacman/js_src/jquery-3.1.1.min.js \
    app/games/pacman/js_src/pacman.js \
    app/games/pacman/js_src/modernizr-1.5.min.js \
    app/games/pacman/js_src/gameplay.js > app/games/pacman/js_src/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/games/pacman/js/pacman.min.js app/games/pacman/js_src/concat.js
rm app/games/pacman/js_src/concat.js

echo "JS uglification successful"

exit 0
