source $ZDOTDIR/functions.zsh


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e


# History
setopt histignorealldups sharehistory


# Use modern completion system
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


### Added by Zplugin's installer
source $ZDOTDIR/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# Prompt - Pure prompt
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Set LS_COLORS - Nord (terminal should use Nord obviously)
zplugin ice atclone"dircolors -b src/dir_colors > clrs.zsh" atpull'%atclone' pick"clrs.zsh"
zplugin light arcticicestudio/nord-dircolors

# Helperes
zplugin light djui/alias-tips

# Various binaries

# Completion and syntax highlighting - load these last, order is important
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# Load this very last 
zplugin ice depth'1' lucid wait'0' atinit"_zpcompinit_custom; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting


# Include other sources
source $ZDOTDIR/aliases.zsh
