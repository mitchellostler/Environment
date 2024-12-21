#!/bin/bash
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -laC --color'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'
alias f='open -a Finder ./'
alias ~="cd ~"
alias box='cd ~/box && vagrant up && vagrant ssh'
alias sbox='cd ~/box && vagrant ssh'
alias c='clear'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"

alias co='git checkout'
alias st='git status'
alias gdf='git diff'
alias add='git add'
alias cg='cd $(git rev-parse --show-toplevel)'

alias cgrep='grep -r --include *\.c --include *\.h'
alias ctset='universal-ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ .'

export DISPLAY=:0

# Fuzzy search for Bash history with fzf
__fzf_history__() {
  command=$(history | tac | fzf | awk '{$1=""; print substr($0,2)}')
  echo $command
  history -s "$command"
  $command
}
bind -x '"\C-r": __fzf_history__'

# CD using Fzf
cf() {
  local dir
  dir=$(find . -type d | fzf +m) # Use fzf to select a directory
  if [[ -n "$dir" ]]; then
    builtin cd "$dir" # Change to the selected directory
    history -s "cd $file"
  fi
}



vf() {
  local file
  file=$(fzf)
  if [ -n "$file" ]; then
    vim "$file"
    history -s "vim $file"
  fi
}

alias findwhite='egrep -r " +$" .'


#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

    alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address

