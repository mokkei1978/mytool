#!/bin/bash


if [ $# -ge 1 ]; then
  cd $1
fi

files=`find ./ -type l`

n=0
for file in ${files}; do
  target=`readlink ${file}`

  if [ -h ${target} ]; then
    target=`readlink ${target}`
  fi

  if [ ! -s ${target} ]; then
    echo "broken : ${file} => ${target}"
    n=`expr ${n} + 1`
  fi
done

if [ ${n} -gt 0 ];then
  echo "broken ${n} links"
  exit 1
fi

exit 0

