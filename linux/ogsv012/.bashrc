# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias df='df -h'
alias front='ssh -Y front.i.mri-jma.go.jp'
alias ogsv009='ssh -Y ogsv009.i.mri-jma.go.jp'
alias oakforest='ssh -Y c24146@ofp.jcahpc.jp'
alias x='xterm &'

export PS1="\[\e[1;35m\]\w>\[\e[00m\] "

#- GrADS scrpit path
export GASCRP="./libgs ./mylib"

setxkbmap -layout jp
#- to avoid US layout keyboard in xterm
