# Use fd instead of find for file completion
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

local color00='#262626'
local color01='#3a3a3a'
local color02='#4e4e4e'
local color03='#8a8a8a'
local color04='#949494'
local color05='#dab997'
local color06='#d5c4a1'
local color07='#ebdbb2'
local color08='#d75f5f'
local color09='#ff8700'
local color0A='#ffaf00'
local color0B='#afaf00'
local color0C='#85ad85'
local color0D='#83adad'
local color0E='#d485ad'
local color0F='#d65d0e'

# Palenight
# --color=bg+:'#444267',bg:'#292D3E',spinner:'#89DDFF',hl:'#82AAFF'
# --color=fg:'#8796B0',header:'#82AAFF',info:'#FFCB6B',pointer:'#89DDFF'
# --color=marker:'#89DDFF',fg+:'#959DCB',prompt:'#FFCB6B',hl+:'#82AAFF'

export FZF_DEFAULT_OPTS="
--color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
--color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
--color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
--no-mouse --height 40% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"

# Exclude those directories even if not listed in .gitignore, or if .gitignore is missing
FD_OPTIONS="--follow --hidden --exclude .git --exclude node_modules"

# Change find backend / Use 'git ls-files' when inside GIT repo, or fd otherwise
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"

# Find commands for "Ctrl+T" and "Opt+C" shortcuts
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
