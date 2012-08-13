#/bin/bash


date > ./backup.date


cd ~/mytool/backup/


echo "Sync Wiki..."
rsync -a ocsv001:/home/ocpublic/public_html/wiki  ~/backup/

echo "Sync Git..."
sh backup_git.sh

#sh backup_mxedata.sh
#echo " MXE data"

echo "Sync Redmine..."
rsync -a ocsv001:~/backup/redmine ~/backup/

echo "Sync html..."
rsync -a ocsv001:~/public_html  ~/backup/

exit 0


