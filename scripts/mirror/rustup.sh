#!/bin/sh

set -e

if [ -n "$BASH_SOURCE" -a "$BASH_SOURCE" != "$0" ]; then
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
else
    echo "Rustup use enviornment variables to set mirror. Use \"source $0\" to set env in your shell."
fi

