#!/bin/bash

SCRIPT_DIR=$(dirname $(realpath $0))
docker run --name xray --restart=always -p 443:443 -v "$SCRIPT_DIR/config.json":/etc/xray/config.json -d teddysun/xray

