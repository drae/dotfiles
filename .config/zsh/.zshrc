source $ZDOTDIR/functions.zsh

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
source $ZDOTDIR/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# Prompt - Pure prompt
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Little notification of aliases
zplugin light djui/alias-tips
# Interactive cd completion with fzf (cd <TAB>)
zplugin light changyuheng/zsh-interactive-cd

zplugin light zsh-users/zsh-history-substring-search

# Completion and syntax highlighting - load these last, order is important
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# Load this very last
zplugin ice depth'1' lucid wait'0' atinit"_zpcompinit_custom; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# Other sources
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/bindings.zsh

# fzf
source $ZDOTDIR/fzf.zsh
source $XDG_CONFIG_HOME/fzf/completion.zsh
source $XDG_CONFIG_HOME/fzf/key-bindings.zsh

