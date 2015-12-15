#!/bin/bash

set -e

version=$1
date=$2
# e.g. 4_1_05 20160105

cd ~/mytool/wiki
sh export_html.sh

cd ~/MRICOM
git push dias master
git push dias MRICOM-${version}-${date}

cd ~/MXE
git push dias master
git push dias MXE-${version}

cd ~/rectangle
git push dias master
git push dias ${version}
git push dias MXE-${version}

cd ~/seto
git push dias master
git push dias ${version}
git push dias MXE-${version}

cd ~/rectangle/exp/run/tool
sh archive_package.sh
sh archive_data.sh
cd ~/DATA/rectangle/tar
scp MRICOM-* sakamoto.k.mri-jma@dias-bs2.tkl.iis.u-tokyo.ac.jp:~/

exit 0
