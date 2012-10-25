#!/bin/bash

stats_file=~/stats.txt


cd ~/stat/

scp front1:~/stat/* front/
ssh front1 "rm ~/stat/*"

files=`find . -type f`
if [ "${files}" = "" ]; then
  exit 0
fi

touch ${stats_file}

for file in ${files}; do
  echo "" >> ${stats_file}
  date >> ${stats_file}
  echo ${file} >> ${stats_file}
  cat ${file} >> ${stats_file}
  rm ${file}
done

exit 0
