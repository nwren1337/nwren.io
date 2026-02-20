#!/bin/bash
DEPLOY='deploy'
ASSETS="$DEPLOY/assets"
IMAGES="$DEPLOY/images"

rm -rf $DEPLOY
mkdir -p "$ASSETS"
mkdir -p "$IMAGES"
echo "$DEPLOY folder reset"

HTML_FILENAME="index.html"
CSS_FILENAME="index.css"
JS_FILENAME="app.js"

html-minifier --collapse-whitespace $HTML_FILENAME "$DEPLOY/$HTML_FILENAME"
echo "HTML minified"

cssnano $CSS_FILENAME "$DEPLOY/$CSS_FILENAME"
echo "CSS minified"

uglifyjs --compress --mangle -o "$DEPLOY/$JS_FILENAME" -- $JS_FILENAME"
echo "Javascript minified"

echo "Minification complete"
