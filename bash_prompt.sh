#!/bin/bash

source ~/Environment/colors.sh

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Unicode symbols
readonly GIT_BRANCH_CHANGED_SYMBOL='+'
readonly GIT_NEED_PULL_SYMBOL='⇣'
readonly GIT_NEED_PUSH_SYMBOL='⇡'
PS_SYMBOL='$'

__powerline() {
 
    __git_info() {
        # no .git directory
    	[ -d .git ] || return

        local aheadN
        local behindN
        local branch
        local marks
        local stats

        # get current branch name or short SHA1 hash for detached head
        branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
        [ -n "$branch" ] || return  # git branch not found

        # how many commits local branch is ahead/behind of remote?
        stats="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
        aheadN="$(echo "$stats" | grep -o 'ahead \d\+' | grep -o '\d\+')"
        behindN="$(echo "$stats" | grep -o 'behind \d\+' | grep -o '\d\+')"
        [ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
        [ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

        # print the git branch segment without a trailing newline
        # branch is modified?
	br1="("
	br2=")"
        if [ -n "$(git status --porcelain)" ]; then
	    printf "%s" "${Blue}$br1$branch$br2$marks"
    else
	    printf "%s" "${Purple}$br1$branch$br2$marks"
        fi
    }
# 
    ps1() {
        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [ "$?" -eq 0 ]; then
            local FG_EXIT="$Green"
        else
            local FG_EXIT="$Red"
        fi

        PS1="\[\e[0;93m\]\u\[\e[m\]"    # username
	PS1+=" "
        PS1+="$(__git_info)"
	PS1+=" "
        PS1+="${FG_EXIT}\W$RESET"
	PS1+=" "
        PS1+="$White${PS_SYMBOL}"
	PS1+=" "
    }

    PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
