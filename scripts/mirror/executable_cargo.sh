#!/bin/sh -e

if [ ! -f "$HOME/.cargo/config" ]; then
    cat >"$HOME/.cargo/config" <<EOF
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"

EOF
else
    echo "$HOME/.cargo/config" already exists. You should edit it manually
fi

