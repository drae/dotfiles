source $ZDOTDIR/functions.zsh

# Options
setopt autocd autopushd pushdignoredups # Type the folder name
setopt append_history inc_append_history extended_history hist_expire_dups_first \
hist_ignore_dups hist_ignore_space hist_verify share_history #History

# Add to fpath
fpath=($XDG_DATA_HOME/completions $fpath)

# Use modern completion system
#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' \
#    'm:{a-z\-}={A-Z\_}' \
#    'r:[^[:alpha:]]|[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
#    'r:[^[:ascii:]]|[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
#zstyle ':completion:*' format $'\n%F{yellow}Completing %d%f\n'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:functions' ignored-patterns '_*'

# fzf
source $ZDOTDIR/fzf.zsh
source $XDG_CONFIG_HOME/fzf/completion.zsh
source $XDG_CONFIG_HOME/fzf/key-bindings.zsh

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

setopt no_aliases
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
setopt aliases

# Enable direnv if installed
[ -s "/usr/bin/direnv" ] && eval "$(direnv hook zsh)"

# Enable duplication of terminal (Windows Terminal et al - CTRL+Shift+D)
if (( ${+WSLENV} )); then
    set_wt_cwd() { printf "\e]9;9;%s\e\\" "$(wslpath -m "$PWD")" }
    precmd_functions+=set_wt_cwd
fi

