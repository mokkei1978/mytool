#!/bin/bash

version=$1
# e.g. 4_1_05

cd ~/MXE

tag_name="MXE-${version}"
git co master
git tag ${tag_name}
git push origin ${tag_name}


exit 0
