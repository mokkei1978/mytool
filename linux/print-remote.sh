#!/bin/bash
#-- Print text to "acitivity stream" at remote server.

set -e

if [ $# -lt 1 ]; then
  echo "Usage: sh $0 status" 
  exit 1
fi


echo "$1"


if [ ! -s stream.conf ]; then
  exit 0
fi

stream_file=`cat stream.conf`
touch ${stream_file}

date=`date +"%m/%d %H:%M"`
root_dir=`printf "%-10s" mytool`
ssh ocsv001 "echo ${date} [${root_dir}] $1 \(ocsv003\) >> ~/stream.txt"

exit 0

