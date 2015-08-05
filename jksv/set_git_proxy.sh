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

#proxy=`git config --list --global | grep http.proxy` && :

if ${jksv}; then
  git config --global http.proxy http://172.31.146.1:8080
  echo "git config --global http.proxy http://172.31.146.1:8080"
else
  git config --global http.proxy http://proxy.mri-jma.go.jp:8080
  echo "git config --global http.proxy http://proxy.mri-jma.go.jp:8080"
fi

exit 0
