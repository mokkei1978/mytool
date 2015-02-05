#!/bin/bash

set -e

jksv=false
option=""
while getopts j option ; do
  case ${option} in
    j) jksv=true ;;
    \?) exit 1 ;;
  esac
done
shift `expr $OPTIND - 1`

proxy=`git config --list --global | grep http.proxy` && :

if ${jksv}; then
  if [ "${proxy}" = "" ]; then
    git config --global http.proxy http://172.31.146.1:8080
    echo "git config --global http.proxy http://172.31.146.1:8080"
  fi
else
  if [ "${proxy}" != "" ]; then
    git config --unset --global http.proxy
    echo "git config --unset --global http.proxy"
  fi
fi

exit 0
