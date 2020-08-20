#!/bin/sh
set -ex
if git diff-index --quiet HEAD --; then
    export VERSION=`git rev-parse HEAD`
else
    export VERSION=`date +%s`
fi
wasm-pack build --target web --out-name=$VERSION
wasm-pack test --headless --chrome
sed -e s/canvas_game/$VERSION/g < index-template.html > index.html
