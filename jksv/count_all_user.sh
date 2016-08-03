#!/bin/bash

set -e

rm -f active_user.txt
touch active_user.txt

for sysname in asuca cgcm chem global marine nhm obs ocean; do
    sh count_user.sh ${sysname}
done

exit 0
