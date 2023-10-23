#!/usr/bin/env bash

set -Eeuo pipefail

declare -r DOTFILES_REPO_URL="https://github.com/drae/dotfiles"

function get_os_type() {
    uname
}

function initialize_linux() {
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install -y \
        ca-certificates \
        git \
        curl \
        python3-pip \
        wget \
        unzip \
        zsh \
        fish
}

function initialize_os_env() {
    local ostype
    ostype="$(get_os_type)"

    if [ "${ostype}" == "Linux" ]; then
        initialize_linux
    else
        echo "Invalid OS type: ${ostype}" >&2
        exit 1
    fi
}

function initialize_dotfiles() {
    function keepalive_sudo() {
        function keepalive_sudo_linux() {
            # Might as well ask for password up-front, right?
            echo "Checking for \`sudo\` access which may request your password."
            sudo -v

            # Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
            while true; do
                sudo -n true
                sleep 60
                kill -0 "$$" || exit
            done 2>/dev/null &
        }

        local ostype
        ostype="$(get_os_type)"

        if [ "${ostype}" == "Linux" ]; then
            keepalive_sudo_linux
        else
            echo "Invalid OS type: ${ostype}" >&2
            exit 1
        fi
    }

    function run_chezmoi() {
        echo "Running chezmoi..."
        sh -c "$(curl -fsLS get.chezmoi.io)" -- init "${DOTFILES_REPO_URL}"
        $HOME/bin/chezmoi apply
    }

    function cleanup_chezmoi() {
        #        rm -f "${HOME}/bin/chezmoi"
    }

    # keepalive_sudo
    run_chezmoi
    cleanup_chezmoi
}

function main() {
    pushd ~ 2>&1 >/dev/null
    initialize_os_env
    initialize_dotfiles
    popd 2>&1 >/dev/null
}

main "$@"
