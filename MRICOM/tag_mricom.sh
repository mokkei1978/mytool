#!/bin/bash

version=$1
date=$2
# e.g. 4_1_05 20160105

cd ~/MRICOM

tag_name="MRICOM-${version}-${date}"
git co master
git tag ${tag_name}
git push origin ${tag_name}
git archive --format=tar --prefix=MRICOM/ HEAD | gzip > ~/${tag_name}.tgz

exit 0
