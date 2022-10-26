#!/bin/sh 

source $(dirname $0)/../utils.sh

sh <(http_get "https://get.docker.com")
# VERSION= sh <(http_get "https://get.docker.com") -- --mirror Aliyun
