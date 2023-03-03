#!/bin/bash


version=$1   # 4.1.05
date_wiki=$2 # 2016_01_05
news=$3

version_wiki=`echo ${version} | sed -e "s/\.//g"`
year=`echo ${date_wiki} | cut -c1-4`
month=`echo ${date_wiki} | cut -c6-7`
month=`expr ${month} - 1`
if [ ${month} -eq 0 ]; then
  year=`expr ${year} - 1`
  month=12
fi


sed -e "s/@version@/${version}/g" -e "s/@year@/${year}/g" -e "s/@month@/${month}/g" \
  -e "s/@news@/${news}/g" < mail.in

exit 0
