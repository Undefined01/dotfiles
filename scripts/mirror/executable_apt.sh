#!/bin/sh -e

if [ "$(whoami)" != "root" ]; then
    echo "Need root priviledge"
    exit 1
fi

sed -i.bak /etc/apt/sources.list -E -e 's/:\/\/.*?\//:\/\/mirrors.ustc.edu.cn\//g'
apt update
