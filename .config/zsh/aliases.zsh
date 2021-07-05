# Alias default commands (mostly)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias df='df -h'
alias du='du -h -d 2'

if [[ $OSTYPE == (linux)* ]]; then
    alias ll='ls -alh --color=auto --group-directories-first'
    alias ls='ls --color=auto --group-directories-first'
elif [[ $OSTYPE == (darwin|freebsd)* ]]; then
    alias ll='ls -alGh'
    alias ls='ls -Gh'
fi

alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias vi='vim'
alias vim='nvim'
alias cat='batcat'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# WSL aliases for common apps
if (( ${+WSLENV} )); then
    [ -s /mnt/c/Windows/System32/OpenSSH/ssh.exe ] && export GIT_SSH="ssh.exe" 
    [ -s /mnt/c/Windows/System32/OpenSSH/ssh.exe ] && alias ssh='/mnt/c/Windows/System32/OpenSSH/ssh.exe'
    [ -s /mnt/c/Windows/System32/OpenSSH/ssh-keygen.exe ] && alias ssh-keygen='/mnt/c/Windows/System32/OpenSSH/ssh-keygen.exe'
    [ -s /mnt/c/Windows/System32/OpenSSH/ssh-add.exe ] && alias ssh-add='/mnt/c/Windows/System32/OpenSSH/ssh-add.exe'
    [ -s /mnt/c/Windows/System32/OpenSSH/scp.exe ] && alias scp='/mnt/c/Windows/System32/OpenSSH/scp.exe'
    [ -s /mnt/c/Windows/System32/OpenSSH/sftp.exe ] && alias sftp='/mnt/c/Windows/System32/OpenSSH/sftp.exe'
    [ -s /mnt/c/Program\ Files\ \(x86\)/gnupg/bin/gpg.exe ] && alias gpg='/mnt/c/Program\ Files\ \(x86\)/gnupg/bin/gpg.exe'

    export SOPS_GPG_EXEC=gpg.exe
fi

# Handle .dotfiles in $HOME
alias shconfig='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Suffix aliases
alias -s {yml,yaml,json,conf,ini,zsh}=vim

# fzf
alias fge='fzf_grep_edit'
alias ffe='fzf_find_edit'

# apt
alias asi='apt-cache pkgnames | fzf --header "[apt:install]" | xargs -d " " -- sudo apt-get install'

# Global aliases
alias -g G='| grep -i'
