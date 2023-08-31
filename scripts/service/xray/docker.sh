#!/bin/bash

docker run --name xray --restart=always -p 443:443 -v /home/lh/scripts/install/xray/config.json:/etc/xray/config.json -d teddysun/xray

