#!/bin/sh -e

if [ -z "$BASH_SOURCE" -o "$BASH_SOURCE" == "$0" ]; then
    echo "Rustup use enviornment variables to set mirror. Use \"source $BASH_SOURCE\" to set env in your shell."
    exit 1
fi

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
