#!/bin/bash

set -e

rm -f active_user.txt
touch active_user.txt

for sysname in asuca cgcm chem global marine nhm obs ocean physlib base; do
    for month in 08 09 10 11 12; do
#    for month in 02 03 04 05 06 07; do
	sh count_user.sh ${sysname} 2017-${month}-01
    done
    sh count_user.sh ${sysname} 2018-01-01
done

exit 0
