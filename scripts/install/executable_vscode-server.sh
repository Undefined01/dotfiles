#!/usr/bin/env bash

set -e

commit_id=$(code --version | sed -n 2p)
target=$1

echo Installing remote server for VS Code commit $commit_id

wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode-server-linux-x64.tar.gz"
wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode_cli_alpine_x64_cli.tar.gz"

scp vscode-server-linux-x64.tar.gz $target:~/
scp vscode_cli_alpine_x64_cli.tar.gz $target:~/

ssh -T $target << EOF
  set -e

  mkdir -p ~/.vscode-server/cli/servers/Stable-$commit_id/server
  tar -xzf ~/vscode-server-linux-x64.tar.gz -C ~/.vscode-server/cli/servers/Stable-$commit_id/server --strip-components 1

  tar -xzf ~/vscode_cli_alpine_x64_cli.tar.gz -C ~/.vscode-server/
  mv ~/.vscode-server/code ~/.vscode-server/code-$commit_id

  rm ~/vscode-server-linux-x64.tar.gz ~/vscode_cli_alpine_x64_cli.tar.gz
EOF

rm vscode-server-linux-x64.tar.gz vscode_cli_alpine_x64_cli.tar.gz
