#!/bin/bash


if [ $# -lt 1 ]; then
  echo usage: sh $0 REPOS_NAME
  exit 1
fi

name=$1.git

if [ -d ${name} ]; then
  echo STOP! ${name} exist.
  exit 1
fi

mkdir ${name}
cd ${name}
git --bare init --shared
cd ..

exit 0
