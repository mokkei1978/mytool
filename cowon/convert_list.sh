#!/bin/bash


if [ $# -eq 0 ]; then
  echo Usage: $0 PLAYLIST_FILE
  exit 1
fi

file_org=$1
file=new/$1

if [ ! -d new ]; then
  mkdir new
fi

echo "#EXTM3U" > ${file}

nkf -w ${file_org} > temp
sed -i -e 's@\\@/@g' temp
sed -i -e 's@D:/MyMusic@I:/Music@g' temp

cat temp | while read path ; do
  filename="${path##*/}"
  filename="${filename%.*}"
  echo "#EXTINF:"${filename} >> ${file}
  echo ${path} >> ${file}
done

exit 0

