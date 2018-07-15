#!/bin/sh

cat app/assets/lib/jquery-v2.2.4.min.js \
    app/assets/lib/bootstrap/bootstrap-v3.3.7.min.js \
    app/assets/lib/datatables/jquery-dataTables-v1.10.16.min.js \
    app/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.js \
    app/assets/lib/slick-carousel-v1.8.1.min.js \
    app/assets/lib/isMobile.js \
    app/assets/lib/jquery-ui/jquery-ui-v1.12.1.js \
    app/assets/lib/jquery-ui/calendar-pl.js \
    app/assets/lib/vex/vex.combined-v4.1.0.min.js \
    app/assets/lib/stroer_client.js \
    app/assets/lib/rollbar_client.js \
    app/assets/js/app.js > app/assets/js/concat.js

echo "JS concatenation successful"

# Minify the combined JS
# Requires: UglifyJS (Node)

uglifyjs --output app/assets/js/app.min.js app/assets/js/concat.js
rm app/assets/js/concat.js

echo "JS uglification successful"

cat app/assets/lib/bootstrap/bootstrap-v3.3.7.min.css \
    app/assets/lib/datatables/bootstrap-dataTables-v1.10.16.min.css \
    app/assets/lib/jquery-ui/jquery-ui-v1.12.1.css \
    app/assets/css/style.css \
    app/assets/lib/vex/vex-v4.1.0.min.css \
    app/assets/lib/vex/vex-theme-flat-attack-v4.1.0.min.css > app/assets/css/concat.css

echo "CSS concatenation successful"

# Minify the combined CSS
# Requires: UglifyCSS (Node)

uglifycss --output app/assets/css/style.min.css app/assets/css/concat.css
rm app/assets/css/concat.css

echo "CSS uglification successful"

exit 0
