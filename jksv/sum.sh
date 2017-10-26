#!/bin/bash

set -e

cat active_user.txt | awk '{print $1$2,$3}' > temp.tbl

members=`cat temp.tbl | awk '{print $1}' | sort | uniq`
for member in ${members}; do
    grep "${member}" temp.tbl | awk 'BEGIN{total=0}{total+=$2}END{print $1,total}'
done

rm -f temp.tbl

exit 0
