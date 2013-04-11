#/bin/bash


cd ~/mytool/backup/

(cd ../linux; ./print.sh "Backup start.")

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

(cd ../linux; ./print.sh "Backup end.")

exit 0


