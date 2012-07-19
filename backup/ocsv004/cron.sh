#/bin/bash


date > ./backup.date


cd /home/ksakamot/mytool/backup/ocsv004


sh backup_wiki.sh
echo " Wiki"

sh backup_git.sh
echo " Git"

#sh backup_mxedata.sh
#echo " MXE data"

sh backup_redmine.sh
echo " Redmine"

sh backup_html.sh
echo " html"

exit 0


