# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Follow the XDG directory spec wherever possible
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:=/run/user/$(id -u)}

# XDG_CONFIG_HOME
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime
export WGETRC=$XDG_CONFIG_HOME/wgetrc

# XDG_DATA_HOME
export NPM_PACKAGES=$XDG_DATA_HOME/npm-packages
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NVM_DIR=$XDG_DATA_HOME/nvm
export HISTFILE=$XDG_DATA_HOME/bash/history

# XDG_CACHE_HOME

# Other stuff
export GOPATH=$HOME/go
# WSL
if [ -z $WSLENV ]; then
    export SSH_AUTH_SOCK=/mnt/c/Users/paul/.ssh/ssh-agent.sock # Use the windows GPG agent socket
fi

# The path
export PATH=$GOPATH/bin:/usr/lib/go/bin:$HOME/.local/bin:$PATH
