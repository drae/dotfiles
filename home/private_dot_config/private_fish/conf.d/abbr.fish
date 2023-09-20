abbr df 'df -H'
abbr diskspace 'sudo df -h | grep -E "sd|lv|Size"'
abbr du 'du -ch'
abbr meminfo 'free -m -l -t'
abbr gpumeminfo 'grep -i --color memory /var/log/Xorg.0.log'
abbr cpuinfo lscpu
abbr pscpu 'ps auxf | sort -nr -k 3'
abbr pscpu10 'ps auxf | sort -nr -k 3 | head -10'
abbr psmem 'ps auxf | sort -nr -k 4'
abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'

if command -sq bat
    abbr -a cat bat
end
