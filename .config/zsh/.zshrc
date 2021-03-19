source $ZDOTDIR/functions.zsh

gpgconf --create-socketdir

# Options
setopt autocd autopushd pushdignoredups # Type the folder name
setopt append_history inc_append_history extended_history hist_expire_dups_first \
hist_ignore_dups hist_ignore_space hist_verify share_history #History

# Add to fpath
fpath=($XDG_DATA_HOME/completions $fpath)

# Use modern completion system
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]|[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:[^[:ascii:]]|[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' format $'\n%F{yellow}Completing %d%f\n'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:functions' ignored-patterns '_*'

### Added by Zplugin's installer
source $ZDOTDIR/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[]=_zinit
### End of Zplugin's installer chunk

# Prompt - Pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# Little notification of aliases
zinit light djui/alias-tips
# Interactive cd completion with fzf (cd <TAB>)
zinit light changyuheng/zsh-interactive-cd

zinit light zsh-users/zsh-history-substring-search

# Completion and syntax highlighting - load these last, order is important
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Load this very last
zinit ice depth'1' lucid wait'0' atinit"_zpcompinit_custom; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

### End of Zinit's installer chunk

# Other sources
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/bindings.zsh

# fzf
source $ZDOTDIR/fzf.zsh
source $XDG_CONFIG_HOME/fzf/completion.zsh
source $XDG_CONFIG_HOME/fzf/key-bindings.zsh

setopt no_aliases
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
setopt aliases

# Enable duplication of terminal (Windows Terminal et al - CTRL+Shift+D)
if [ ${ISWSL} ]; then
    set_wt_cwd() { printf "\e]9;9;%s\e\\" "$(wslpath -m "$PWD")" }
    precmd_functions+=set_wt_cwd
fi

if [ ${ISWSL} -eq 1 ]; then
    # WSL 1 could use AF_UNIX sockets from Windows side directly
    if [ -n ${WSL_AGENT_HOME} ]; then
        export GNUPGHOME=${WSL_AGENT_HOME}
        export SSH_AUTH_SOCK=${WSL_AGENT_HOME}/S.gpg-agent.ssh
    fi
elif [ ${ISWSL} -eq 2 ]; then
    if [ -n ${WIN_GNUPG_HOME} ]; then
        # setup gpg-agent socket
        _sock_name=${GNUPGHOME}/S.gpg-agent
        ss -a | grep -q ${_sock_name}
        if [ $? -ne 0  ]; then
            rm -f ${_sock_name}
            ( setsid socat UNIX-LISTEN:${_sock_name},fork EXEC:"/mnt/c/ProgramData/win-gpg-agent/sorelay.exe -a ${WIN_GNUPG_HOME//\:/\\:}/S.gpg-agent",nofork & ) >/dev/null 2>&1
        fi

        # setup gpg-agent.extra socket
        _sock_name=${GNUPGHOME}/S.gpg-agent.extra
        ss -a | grep -q ${_sock_name}
        if [ $? -ne 0  ]; then
            rm -f ${_sock_name}
            ( setsid socat UNIX-LISTEN:${_sock_name},fork EXEC:"/mnt/c/ProgramData/win-gpg-agent/sorelay.exe -a ${WIN_GNUPG_HOME//\:/\\:}/S.gpg-agent.extra",nofork & ) >/dev/null 2>&1
        fi

        unset _sock_name
    fi

    if [ -n ${WIN_AGENT_HOME} ]; then
        # and ssh-agent socket
        export SSH_AUTH_SOCK=${GNUPGHOME}/S.gpg-agent.ssh
        ss -a | grep -q ${SSH_AUTH_SOCK}
        if [ $? -ne 0  ]; then
            rm -f ${SSH_AUTH_SOCK}
            ( setsid socat UNIX-LISTEN:${SSH_AUTH_SOCK},fork EXEC:"/mnt/c/ProgramData/win-gpg-agent/sorelay.exe ${WIN_AGENT_HOME//\:/\\:}/S.gpg-agent.ssh",nofork & ) >/dev/null 2>&1
        fi
    fi
fi
