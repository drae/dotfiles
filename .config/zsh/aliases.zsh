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
alias vi='vim'
alias vim='nvim'
alias cat='batcat'


# Suffix aliases
alias -s {yml,yaml,json,conf,ini,zsh}=vim


# Global aliases
alias -g G='| grep -i'


# Personal aliases
alias exl='exa -al --group-directories-first'
alias exa='exa -a --group-directories-first'
alias exg='exa -al --git --git-ignore --group-directories-first'

# Handle my dotfiles in $HOME
alias git-dot='git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME"'

# fzf
alias fge='fzf_grep_edit'
alias ffe='fzf_find_edit'
alias gll='fzf_git_log'
alias grl='fzf_git_reflog'
alias glS='fzf_git_log_pickaxe'

# apt
alias asi='apt-cache pkgnames | fzf --header "[apt:install]" | xargs -d " " -- sudo apt-get install'
