#/bin/bash

org=/home/git/public_html/wiki
copy1=/home/ksakamot/backup


rsync -a ${org} ${copy1}/
rsync -a ${copy1}/wiki ocsv005:/home/ksakamot/backup/
rsync -a ${copy1}/wiki ocsv011:/home/ksakamot/backup/


