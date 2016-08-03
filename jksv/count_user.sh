#!/bin/bash

#set -e

sysname=$1

rm -f activity
wget http://jksv-pj.npd.naps.kishou.go.jp/redmine/${sysname}/activity

grep "mri-jma" member/${sysname}.tbl > temp.tbl
awk '{OFS="\t"}{print $2,$3 }' temp.tbl > temp2.tbl

while read name1 name2; do

    name="${name1} ${name2}"
    commit_num=`grep "${name}" activity | wc -l`
    if [ ${commit_num} -eq 0 ]; then
	continue
    fi
    echo ${name} ${commit_num}
    echo ${name} ${commit_num} >> active_user.txt

done < temp2.tbl

rm activity temp.tbl temp2.tbl

exit 0
