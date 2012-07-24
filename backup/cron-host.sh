#/bin/bash


date > ./backup.date


cd ~/mytool/backup/


echo "Sync Git..."
sh backup_git.sh

#sh backup_mxedata.sh

echo "Backup Redmine..."
sh backup_redmine.sh


exit 0


