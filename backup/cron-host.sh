#/bin/bash


cd ~/mytool/backup/

(cd ../linux; ./print.sh "Backup start.")

echo "Sync Git..."
sh backup_git.sh

#sh backup_mxedata.sh

echo "Backup Redmine..."
sh backup_redmine.sh

(cd ../linux; ./print.sh "Backup end.")

exit 0


