#!/bin/sh -e

if [ ! -f "$HOME/.cargo/config" ]; then
    cat >"$HOME/.cargo/config" <<EOF
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"

EOF
else
    echo "$HOME/.cargo/config" already exists. You should edit it manually
fi

