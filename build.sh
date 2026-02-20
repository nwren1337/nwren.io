#!/bin/bash
set -e

STATIC="static"

# Minify CSS
npx esbuild "$STATIC/index.css" --minify --outfile="$STATIC/index.css" --allow-overwrite
echo "CSS minified"

# Minify JS
for jsfile in matrix.js nav.js app.js; do
  npx esbuild "$STATIC/$jsfile" --minify --outfile="$STATIC/$jsfile" --allow-overwrite
done
echo "JS minified"

# Minify HTML (collapse whitespace)
for htmlfile in "$STATIC"/*.html; do
  sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' "$htmlfile"
done
echo "HTML minified"

echo "Build complete"
