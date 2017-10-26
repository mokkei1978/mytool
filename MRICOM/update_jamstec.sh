#!/bin/bash

set -e

version=$1
date=$2
# e.g. 4_1_05 20160105

~/mytool/jksv/set_git_proxy.sh

cd ~/mytool/wiki
sh export_html.sh
cd ~/public_html/html_mricom
git add -A .
git commit -m "${date}"
git push jamstec master

cd ~/MRICOM
git push jamstec master
git push jamstec MRICOM-${version}-${date}
git push jamstec 4_2

cd ~/MXE
git push jamstec master
git push jamstec MXE-${version}

cd ~/rectangle
git push jamstec master
git push jamstec ${version}
git push jamstec MXE-${version}

cd ~/seto
git push jamstec master
git push jamstec ${version}
git push jamstec MXE-${version}

~/mytool/jksv/set_git_proxy.sh -j

exit

cd ~/rectangle/exp/run/tool
sh archive_package.sh
sh archive_data.sh
cd ~/DATA/rectangle/tar
scp MRICOM-* sakamoto.k.mri-jma@dias-bs2.tkl.iis.u-tokyo.ac.jp:~/

exit 0
