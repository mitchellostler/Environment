#!/bin/bash

source ~/bash_prompt.sh
source ~/bash_aliases.sh
source ~/.bash_local

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

alias pip='python -m pip'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#echo "     _________
#    / ======= \\
#   / __________\\
#  | ___________ |
#  | | -       | |
#  | |         | |
#  | |_________| |________________________
#  \=____________/   Mitchell Ostler      )
#  / \"\"\"\"\"\"\"\"\"\"\" \\                       /
# / ::::::::::::: \\                  =D-'
#(_________________)"
