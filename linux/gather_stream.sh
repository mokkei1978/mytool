#!/bin/bash

stream_file=stream.txt

stream_servers=`cat stream_servers.conf` || exit 1

for server in ${stream_servers}; do 

  scp ${server}:~/${stream_file} . || exit 1
  ssh ${server} "echo > ~/${stream_file}"

  sed -e "/^$/d" ${stream_file} | sed -e "s/$/ (${server})/"  >> ~/${stream_file}

  rm ${stream_file}

done

exit 0
