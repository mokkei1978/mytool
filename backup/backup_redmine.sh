#/bin/bash
#- local server

org=/home/git/redmine-1.2.1/
copy1=/home/ksakamot/backup/redmine

mysqldump -u git -pgit redmine > ~/backup/redmine/mysql.db
rsync -a /home/git/redmine-1.2.1/files ~/backup/redmine/

exit 0


