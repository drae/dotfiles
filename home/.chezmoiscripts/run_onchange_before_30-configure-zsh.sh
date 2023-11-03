#!/usr/bin/env bash

function is_zsh_installed() {
  command -v zsh >/dev/null
}

function is_zsh_in_shells() {
  zsh=$(command -v zsh)
  grep "${zsh}" /etc/shells >/dev/null
}

function is_zsh_current_shell() {
  zsh=$(command -v zsh)
  if [[ ${SHELL} == "${zsh}" ]]; then
    return 0
  fi
  return 1
}

function install_zsh_shell() {
  if is_zsh_installed; then
    if ! is_zsh_in_shells; then
      zsh=$(command -v zsh)
      echo "Need to add zsh as a shell"
      echo "${zsh}" | sudo tee -a /etc/shells >/dev/null 2>&1
    fi

    if ! is_zsh_current_shell; then
      zsh=$(grep $(command -v zsh) /etc/shells | head -1)
      echo "Changing shell to zsh"
      sudo chsh -s ${zsh} $(whoami)
    fi
  fi
}

function main() {
  install_zsh_shell
}

if [[ ${#BASH_SOURCE[@]} = 1 ]]; then
  main
fi
