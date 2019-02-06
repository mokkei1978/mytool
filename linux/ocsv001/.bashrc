# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#PGI Compiler 
#export PGI=/opt/pgi
#export PATH=$PGI/linux86-64/2011/bin:$PATH
#export PATH=$PGI/linux86-64/2011/mpi/mpich/bin:$PATH
#export MANPATH=$MANPATH:$PGI/linux86-64/2011/man
#export LM_LICENSE_FILE=$PGI/license.dat

#- netCDF
#export PATH=/usr/local/netcdf/bin:$PATH

#- OpenMPI
#export PATH=/opt/pgi/linux86-64/2011/mpi/openmpi-1.4.3/bin:$PATH
#export LD_LIBRARY_PATH=/opt/pgi/linux86-64/2011/mpi/openmpi-1.4.3/lib:$LD_LIBRARY_PATH

#- GrADS scrpit path
export GASCRP="./libgs ./mylib"

alias df='df -h'
alias dias='ssh sakamoto.k.mri-jma@dias-bs2.tkl.iis.u-tokyo.ac.jp'
alias front='ssh -Y front'
alias ogsv007='ssh -Y ocsv007'
alias x='xterm &'
alias ls='ls --color=auto'
alias ll='ls -l'

export PS1="\[\e[1;32m\]\w>\[\e[00m\] "

#- IDL licence
#/usr/local/exelis/envi51/bin/envi-setup.bash
#/usr/local/exelis/idl83/bin/idl_setup.bash
#export LM_LICENSE_FILE="1700@grsv.mri-jma.go.jp:17000@ldapsv1.mri-jma.go.jp:17000@ldapsv2.mri-jma.go.jp"

eval $(dircolors -b ~/.dir_colors)

module load pgi_netcdf

#- Python 3.6.5
export PATH=/home/ksakamot/lib/python3.6.5/bin:/home/ksakamot/lib/geos-3.3.3/bin$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ksakamot/lib/google-cloud-sdk/path.bash.inc' ]; then source '/home/ksakamot/lib/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ksakamot/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/home/ksakamot/lib/google-cloud-sdk/completion.bash.inc'; fi
