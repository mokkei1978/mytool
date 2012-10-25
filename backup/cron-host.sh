#/bin/bash


cd ~/mytool/backup/

sh stat.sh "Backup start." backup.txt


echo "Sync Git..."
sh backup_git.sh

#sh backup_mxedata.sh

echo "Backup Redmine..."
sh backup_redmine.sh


sh stat.sh "Backup end." backup.txt

exit 0


