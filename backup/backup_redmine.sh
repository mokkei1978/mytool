#/bin/bash
#- local server

mysqldump -u ocpublic -pkaiyou04 redmine > ~/backup/redmine/mysql.db
rsync -a /home/ocpublic/redmine-1.4.4/files ~/backup/redmine/

exit 0


