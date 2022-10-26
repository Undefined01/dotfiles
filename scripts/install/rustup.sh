#!/bin/sh 

source $(dirname $0)/../utils.sh

sh <(http_get "https://sh.rustup.rs")
