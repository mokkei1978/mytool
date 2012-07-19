#/bin/bash

repos="MXE CORE2jpn rectangle MRICOM3 seto mytool"



cd /home/ksakamot/backup/

for dir in ${repos}; do
  cd ${dir}
  git pull
  git push ocsv005
  git push ocsv011
  cd ..
done

exit 0


