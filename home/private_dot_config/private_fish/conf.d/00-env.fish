set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

set -gx LANG "en_GB.utf-8"
set -gx LC_CTYPE "en_GB.utf-8"
set -gx LC_ALL "en_GB.utf-8"

set -gx VISUAL nvim
set -gx EDITOR nvim

fish_add_path --global --prepend $HOME/.local/bin
