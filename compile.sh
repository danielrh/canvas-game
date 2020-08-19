#!/bin/sh
wasm-pack build --target web
wasm-pack test --headless --chrome
