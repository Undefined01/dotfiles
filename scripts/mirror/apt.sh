#!/bin/sh

set -e

sed -i /etc/apt/sources.list -E -e 's/:\/\/.*?\//:\/\/mirrors.ustc.edu.cn\//g'

