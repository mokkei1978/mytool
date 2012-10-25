#!/bin/bash
#-- Add STATUS(ARG1) to ~/stat/stat.txt(or ARG2).


#- ARGS
if [ $# -lt 1 ]; then
  echo "Usage: sh $0 status [stat_file]" 
  exit 1
fi

status="$1"

stat_file="stat.txt"
if [ $# -ge 2 ]; then
  stat_file=$2
fi
stat_file=~/stat/${stat_file}


#- Add status.
touch ${stat_file}
echo "${status}" >> ${stat_file}


exit 0


