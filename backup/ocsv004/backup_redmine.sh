#/bin/bash

org=/home/git/redmine-1.2.1/
copy1=/home/ksakamot/backup/redmine

mysqldump -u git -pgit redmine > ${copy1}/mysql.db
rsync -a ${org}/files ${copy1}/
rsync -a ${copy1} ocsv005:/home/ksakamot/backup/
rsync -a ${copy1} ocsv011:/home/ksakamot/backup/


