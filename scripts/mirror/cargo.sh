#!/bin/sh

set -e

if [ ! -f "$HOME/.cargo/config" ]; then
    cat >"$HOME/.cargo/config" <<EOF
replace-with = "ustc"

[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"

[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
EOF
else
    echo "$HOME/.cargo/config" already exists. You should edit it manually
fi

