# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#set a fancy prompt (non-color, unless we know we *want* color)
case "$TERM" in
  xterm-color|xterm|linux|screen|tmux)
    COLOR_RED='\e[91m'
    COLOR_YELLOW='\e[93m'
    COLOR_GREEN='\e[92m'
    COLOR_BLUE='\e[94m'
    COLOR_RESET='\e[0m'

    if [ "$(whoami)" == "root" ]; then
      PS_USER="$COLOR_RED\\u@\\H$COLOR_RESET"
    else
      PS_USER="$COLOR_GREEN\\u@\\H$COLOR_RESET"
    fi
    PS1="\n$PS_USER $COLOR_RED\w $COLOR_YELLOW[\t]$COLOR_RESET\n\\$ "
    ;;
  *)
    #	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \#$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
	alias ls='ls --color=auto -sh -C'
	alias ls1='ls --color=auto -sh -C -1'
	alias ls2='ls --color=auto -sh -C -w 80'
	alias la='ls --color=auto -sh -C -a'
	alias ll='ls --color=auto -alsh '
	alias ..='cd ..'
	alias cd..='cd ..'
	alias dir='ls --color=auto --format=vertical -rt'
	alias grep='grep --color'
	alias rm="rm -f"
	export EDITOR='vim'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
