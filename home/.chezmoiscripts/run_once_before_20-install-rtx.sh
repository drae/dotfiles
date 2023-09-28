#!/usr/bin/env bash

#set -Eeuox pipefail
set -Eeuo pipefail

function is_rtx_exists() {
  test -f "$HOME/.local/bin/rtx"
}

function install_rtx() {
  if ! is_rtx_exists; then
    curl -Ls https://github.com/jdx/rtx/releases/download/v2023.9.2/rtx-v2023.9.2-linux-x64 -o $HOME/.local/bin/rtx
    chmod +x $HOME/.local/bin/rtx
  fi
}

function main() {
  install_rtx
}

if [ ${#BASH_SOURCE[@]} = 1 ]; then
  main
fi
