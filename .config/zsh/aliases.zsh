# Alias default commands (mostly)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias df='df -h'
alias du='du -h -d 2'

if [[ $OSTYPE == linux || $OSTYPE == linux-gnu ]]; then
    alias ll='ls -alh --color=auto --group-directories-first'
    alias ls='ls --color=auto --group-directories-first'
elif [[ $OSTYPE == darwin ]]; then
    alias ll='ls -alGh'
    alias ls='ls -Gh'
fi

alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Suffix aliases
alias -s {yml,yaml,json,conf,ini}=vim


# Global aliases
alias -g G='| grep -i'


# Check for existence of command before aliasing
if (( $+commands[nvim] )); then alias vim='nvim'; fi
if (( $+commands[bat] )); then alias cat='bat'; fi
if (( $+commands[exa])); then
    alias exl='exa -al --group-directories-first'
    alias exa='exa -a --group-directories-first'
    alias exg='exa -al --git --git-ignore --group-directories-first'
fi

# Expand git command when in home folder for dotfiles
alias git='[[ $PWD != $HOME ]] && git || git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME"'
