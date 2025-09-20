#!/bin/sh
docker build . -t xva-bridge:latest --progress=plain
mkdir -p build/
docker run --rm --entrypoint cat xva-bridge:latest /root/build/xva_bridge.bin > ./build/xva_bridge.bin
