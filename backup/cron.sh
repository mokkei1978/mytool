#/bin/bash

date > log.txt
sh /home/ksakamot/backup/backup_wiki.sh
sh /home/ksakamot/backup/backup_git.sh
sh /home/ksakamot/backup/backup_mxedata.sh
sh /home/ksakamot/backup/backup_redmine.sh



