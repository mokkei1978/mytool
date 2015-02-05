#/bin/bash

set -e

cd ~/mytool/backup/

(cd ../linux; ./print-remote.sh "Backup start.")

echo "Sync Wiki..."
rsync -a ocsv001:/home/ocpublic/public_html/wiki  ~/backup/

echo "Sync Git..."
sh backup_git.sh

echo "Copy data..."
sh backup_data.sh

echo "Sync html..."
rsync -a ocsv001:~/public_html  ~/backup/

(cd ../linux; ./print-remote.sh "Backup end.")

exit 0


