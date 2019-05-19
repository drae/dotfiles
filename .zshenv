# Follow the XDG directory spec wherever possible
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:=/run/user/$(id -u)}

# XDG_CONFIG_HOME
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime
export WGETRC=$XDG_CONFIG_HOME/wgetrc

# XDG_DATA_HOME
export ZSH_DATA_DIR=$XDG_DATA_HOME/zsh
export NPM_PACKAGES=$XDG_DATA_HOME/npm-packages
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NVM_DIR=$XDG_DATA_HOME/nvm

# XDG_CACHE_HOME
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

# Other stuff
export GOPATH=$HOME/go
# WSL
if (( ${+WSLENV} )); then
    export SSH_AUTH_SOCK=/mnt/c/Users/paul/.ssh/ssh-agent.sock # Use the windows GPG agent socket
fi

# The path
export PATH=$GOPATH/bin:/usr/lib/go/bin:$HOME/.local/bin:$PATH

# Set umask to user and group rw(x)
umask 022

# History
export HISTFILE=$ZSH_DATA_DIR/history
export HISTSIZE=10000
export SAVEHIST=1000000
export LISTMAX=50
if [[ $UID == 0 ]]; then
    # Do not add in root
    unset HISTFILE
    export SAVEHIST=0
fi

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Set the editor
export EDITOR="vim"
export VISUAL="vim"
