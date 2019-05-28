_zpcompinit_custom() {
    setopt extendedglob local_options
    autoload -Uz compinit
    
    local zcd=$ZSH_CACHE_DIR/zcompdump-$ZSH_VERSION
    local zcdc="$zcd.zwc"
    
    # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
    # in the background as this is doesn't affect the current session
    if [[ -f "$zcd"(#qN.m+1) ]]; then
        compinit -i -d "$zcd"
        { rm -f "$zcdc" && zcompile "$zcd" } &!
    else
        compinit -C -d "$zcd"
        { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
    fi
}

# fzf extra commands
fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
        rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
        --preview "bat --color=always --line-range {2}: {1}"
    )
    
    local file=$(echo "$match" | cut -d':' -f1)
    
    if [[ -n $file ]]; then
        $EDITOR +$(echo "$match" | cut -d':' -f2) $file
    fi
}

fzf_find_edit() {
    local file=$(
        fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
    )
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}

fzf_git_log() {
    local commits=$(
        git ll --color=always "$@" |
        fzf --ansi --no-sort --height 100% \
        --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I@ sh -c 'git show --color=always @'"
    )
    if [[ -n $commits ]]; then
        local hashes=$(printf "$commits" | cut -d' ' -f2 | tr '\n' ' ')
        git show $hashes
    fi
}

fzf_git_reflog() {
    local hash=$(
        git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --height 100% \
        --preview "git show --color=always {1}"
    )
    echo $hash
}

fzf_git_log_pickaxe() {
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local commits=$(
        git log --oneline --color=always -S "$@" |
        fzf --ansi --no-sort --height 100% \
        --preview "git show --color=always {1}"
    )
    if [[ -n $commits ]]; then
        local hashes=$(printf "$commits" | cut -d' ' -f1 | tr '\n' ' ')
        git show $hashes
    fi
}

# From http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
# CTRL+Z to switch between active buffer/shell
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
