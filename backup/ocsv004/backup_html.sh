#/bin/bash

org=/home/ksakamot/public_html
copy1=/home/ksakamot/backup


rsync -a ${org} ${copy1}/
rsync -a ${copy1}/public_html ocsv005:/home/ksakamot/backup/
rsync -a ${copy1}/public_html ocsv011:/home/ksakamot/backup/


