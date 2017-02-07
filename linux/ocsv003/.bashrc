# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias df='df -h'

export PS1="\[\e[1;35m\]\w>\[\e[00m\] "

#- MPI
export  PATH=/opt/pgi/linux86-64/2013/mpi/mpich-3.2/bin:$PATH

#- GrADS scrpit path
export GASCRP="./libgs ./mylib"
