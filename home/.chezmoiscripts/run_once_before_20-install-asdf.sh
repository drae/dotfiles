#!/usr/bin/env bash

#set -Eeuox pipefail
set -Eeuo pipefail

function is_asdf_exists() {
  test -f "$HOME/.asdf/bin/asdf"
}

function install_asdf() {
  if ! is_asdf_exists; then
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch "v0.11.3"
    . "$HOME/.asdf/asdf.sh"
  fi
}

function main() {
  install_asdf
}

if [ ${#BASH_SOURCE[@]} = 1 ]; then
  main
fi
