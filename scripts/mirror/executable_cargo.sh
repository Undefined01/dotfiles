#!/bin/sh -e

if [ ! -f "$HOME/.cargo/config.toml" ]; then
    cat >"$HOME/.cargo/config.toml" <<EOF
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"

EOF
else
    echo "$HOME/.cargo/config.toml" already exists. You should edit it manually
fi

