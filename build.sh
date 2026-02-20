#!/bin/bash
set -e

STATIC="static"

# Minify CSS
npx esbuild "$STATIC/index.css" --minify --outfile="$STATIC/index.css" --allow-overwrite
echo "CSS minified"

# Minify JS
npx esbuild "$STATIC/app.js" --minify --outfile="$STATIC/app.js" --allow-overwrite
echo "JS minified"

# Minify HTML (collapse whitespace)
sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' "$STATIC/index.html"
echo "HTML minified"

echo "Build complete"
