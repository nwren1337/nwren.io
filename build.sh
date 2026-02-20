#!/bin/bash
set -e

STATIC="static"

# Minify CSS
npx esbuild "$STATIC/index.css" --minify --outfile="$STATIC/index.css" --allow-overwrite && echo "CSS minified" || echo "CSS minification failed, skipping..."
git push --set-upstream origin improvedeploy
# Minify JS
npx esbuild "$STATIC/app.js" --minify --outfile="$STATIC/app.js" --allow-overwrite && echo "JS minified" || echo "JS minification failed, skipping..."

# Minify HTML (collapse whitespace)
sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' "$STATIC/index.html" && echo "HTML minified" || echo "HTML minification failed, skipping..."

echo "Build complete"
