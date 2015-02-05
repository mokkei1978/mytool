# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias df='df -h'

export PS1="\[\e[1;35m\]\w>\[\e[00m\] "
