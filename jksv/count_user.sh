#!/bin/bash

#set -e

sysname=$1
date=$2

if [ "$2" != "" ] ; then
    page="activity?from=${date}"
else
    page="activity"
fi

rm -f activity
wget http://jksv-pj.npd.naps.kishou.go.jp/redmine/${sysname}/${page}

grep "mri-jma" member/${sysname}.tbl > temp.tbl
awk '{OFS="\t"}{print $2,$3 }' temp.tbl > temp2.tbl

while read name1 name2; do

    name="${name1} ${name2}"
    commit_num=`grep "${name}" ${page} | wc -l`
    if [ ${commit_num} -eq 0 ]; then
	continue
    fi
    echo ${name} ${commit_num}
    echo ${name} ${commit_num} >> active_user.txt

done < temp2.tbl

rm ${page} temp.tbl temp2.tbl

exit 0
