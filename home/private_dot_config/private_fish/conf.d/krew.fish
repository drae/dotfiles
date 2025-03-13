if type -q krew
    abbr krew kubectl krew
    fish_add_path --global $HOME/.krew/bin
end
