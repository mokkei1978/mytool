#!/bin/bash


version=$1   # 4.1.05
date_wiki=$2 # 2016_01_05 

version_wiki=`echo ${version} | sed -e "s/\.//g"`
date=`echo ${date_wiki} | sed -e "s@_@/@g"`

sed -e "s/@version@/${version}/g" -e "s%@date@%${date}%g" \
 -e "s/@version_wiki@/${version_wiki}/g" -e "s/@date_wiki@/${date_wiki}/g" < release.in

exit 0
