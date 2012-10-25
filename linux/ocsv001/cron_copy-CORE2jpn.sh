#!/bin/bash


#-- scp working?
check=`ps -u ksakamot | grep scp`
if [ "${check}" != "" ]; then
  exit 0
fi


dirs="result sub"
cd ~/CORE2jpn/postp/


. config.sh

for dir in ${dirs}; do

  trigger=${dir_remote}/${dir}/expname.txt

  ssh front1 "test -s ${trigger}"
  if [ $? -eq 0 ]; then

    exp=`ssh front1 "sed -n '1,1p' ${trigger}"`
    ssh front1 "rm -f ${trigger}"
    nohup sh copy_result.sh ${exp} ${dir} &
    exit 0
  fi

done

exit 0
